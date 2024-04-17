import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:recipe_app/presentation/user_profile/view/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';

class AddRecipeController extends ChangeNotifier {
  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenJsonString = sharedPreferences.getString(AppConfig.loginData);
    if (tokenJsonString != null) {
      Map<String, dynamic> tokenData = jsonDecode(tokenJsonString);
      String? accessToken = tokenData['tokens']['access'];
      return accessToken;
    }
    return null;
  }

  void onRecipeAdd(BuildContext context,
      {required String categoryName,
      required String title,
      required String desc,
      File? image,
      required String cookTime,
      // List<String>? ingredients,
      required String ingredientsJson,
      required String procedureJson}) async {
    List<String> ingredients = jsonDecode(ingredientsJson).cast<String>();
    List<String> procedure = jsonDecode(procedureJson).cast<String>();
    try {
      String? accessToken = await getAccessToken();

      if (accessToken != null) {
        var imageUrl = "${AppConfig.baseurl}recipe/create/";
        onUpload(imageUrl, image, categoryName, title, desc, cookTime,
                accessToken, ingredients, procedure)
            .then((value) {
          if (value.statusCode == 201) {
            log("on upload${value.statusCode}");
            var data = jsonDecode(value.body);
            log("$data");
            log("Added Successfully");
            AppUtils.oneTimeSnackBar("Added Succesfully", context: context,bgColor: Colors.green);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNav(),));
          } else {
            log("FAILED TO UPLOAD");
            AppUtils.oneTimeSnackBar(" Error adding ", context: context,bgColor: Colors.red);
          }
        });
      } else {
        log("access token is null");
        AppUtils.oneTimeSnackBar(" Error adding ", context: context,bgColor: Colors.red);
      }
    } catch (e) {
      log("$e");
      AppUtils.oneTimeSnackBar(" Error adding ", context: context,bgColor: Colors.red);
    }
  }

  Future<http.Response> onUpload(
    String url,
    File? selectedImage,
    String categoryName,
    String title,
    String desc,
    String cookTime,
    String accessToken,
    List<String>? ingredientsJson,
    List<String>? procedureJson,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      // 'Accept': 'application/json',
      "Authorization": "Bearer $accessToken"
    };

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      print(" Access Token: $accessToken");

      request.files.add(
        await http.MultipartFile.fromPath(
          'picture',
          selectedImage.path,
        ),
      );
    }

    String? ingredientsJsonString;
    if (ingredientsJson != null) {
      ingredientsJsonString = jsonEncode(ingredientsJson);
    }
    String? procedureJsonString;
    if (procedureJson != null) {
      procedureJsonString = jsonEncode(procedureJson);
    }

    request.fields['picture'] = selectedImage!.path;
    request.fields['category_name'] = categoryName;
    request.fields['title'] = title;
    request.fields['desc'] = desc;
    request.fields['cook_time'] = cookTime;
    request.fields['ingredients'] = ingredientsJsonString ?? "";
    request.fields['procedure'] = procedureJsonString ?? "";

    request.headers.addAll(headers);

    print("Request URL>>>>>: $url");
    print("Request Headers>>>>>>>: $headers");
    print("Request Body: ${request.fields},Files>>>> ${request.files}");

    var res = await request.send();
    print("Response:>>>>>> ${res.statusCode}->>>>>> ${res.reasonPhrase}");
    return await http.Response.fromStream(res);
  }
}

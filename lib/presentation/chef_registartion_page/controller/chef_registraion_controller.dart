import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/login/view/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';

class ChefRegistrationController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  void onRegistration(BuildContext context, String uname, String email,
      String password, File? image) async{
    try{
      var imageUrl = "${AppConfig.baseurl}chef/register/";
      onUpload(imageUrl, image, uname,email,password)
          .then((value) {
        if (value.statusCode == 201) {
          log("on upload${value.statusCode}");
          var data = jsonDecode(value.body);
          log("$data");
          log("Added Successfully");
          AppUtils.oneTimeSnackBar("Registered Successfully", context: context,bgColor: Colors.green);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage(),));
        } else {
          log("FAILED TO UPLOAD");
          AppUtils.oneTimeSnackBar(" Error adding ", context: context,bgColor: Colors.red);
        }
      });
    }catch(e){

    }
  }

  Future<http.Response> onUpload(
      String url,
      File? selectedImage, String uname, String email, String password,
      ) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          selectedImage.path,
        ),
      );
    }

    request.fields['image'] = selectedImage!.path;
    request.fields['username'] = uname;
    request.fields['email'] = email;
    request.fields['password'] = password;

    print("Request URL>>>>>: $url");
    // print("Request Headers>>>>>>>: $headers");
    print("Request Body: ${request.fields},Files>>>> ${request.files}");

    var res = await request.send();
    print("Response:>>>>>> ${res.statusCode}->>>>>> ${res.reasonPhrase}");
    return await http.Response.fromStream(res);
  }
}

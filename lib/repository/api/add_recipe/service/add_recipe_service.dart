
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config/app_config.dart';
import '../../../helper/api_helper.dart';

class AddRecipeService {
  static Future<dynamic> postRecipe(Map<String, dynamic> data) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String? token = sharedPreferences.getString(AppConfig.loginData);
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
    try {
      String? accessToken = await getAccessToken();
      var encodedData = await ApiHelper.postData(
        endPoint: "recipe/create/",
        body: data,
        headers: {"Authorization": "Bearer $accessToken"},
      );

      if (encodedData["status"] == 1) {
        return encodedData;
      } else {
        return encodedData;
      }
    } catch (e) {
      print(e);
      // You can handle errors here
      throw e;
    }
  }
}

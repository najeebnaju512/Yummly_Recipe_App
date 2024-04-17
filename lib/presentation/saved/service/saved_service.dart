import 'dart:convert';
import 'dart:developer';

import 'package:recipe_app/repository/helper/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';

class SavedPageService {
  static Future<dynamic> fetchData(String id) async{
    try {
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
      String? accessToken = await getAccessToken();
      var decodedData = ApiHelper.getDataWithoutStatus(
          endPoint: "user/profile/$id/bookmarks/",
          header: {"Authorization": "Bearer $accessToken"});
      return decodedData;
    } catch (e) {
      log("$e");
    } 
  }
  }
  
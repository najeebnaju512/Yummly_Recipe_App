import 'dart:convert';
import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';


class CreatorsServiceScreen {
  static Future<dynamic> getCreatorsList() async {
    try {
      var decodedData = await ApiHelper.getData(endPoint: "followers/users");
      log("service=> " + decodedData.toString());
      if (decodedData != null && decodedData['status'] == 1) {
        log("Data fetched Successfully");
        return decodedData;
      } else {
        log("failed to fetch data: ${decodedData?['status']}");
        return decodedData;
      }
    } catch (e) {
      log("Error fetching data: $e");
      return null;
    }
  }

  static followUser(Map<String, dynamic> data) async {
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
      var decodedData = await ApiHelper.postData(
        endPoint: "followers/follow/",
        body: data,
        header: {"Authorization": "Bearer $accessToken"}
        // header: ApiHelper.getApiHeaderForException(access: await AppUtils.getAccessToken()),
      );
      return decodedData;
    } catch (e) {
      log("fail >>>>>>: $e");
    }
  }
}

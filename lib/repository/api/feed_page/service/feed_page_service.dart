import 'dart:convert';
import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config/app_config.dart';

class FeedPageService {
  static Future<dynamic> fetchData() async {
    try {
      var decodeData = await ApiHelper.getData(
          endPoint: "recipe/feed/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodeData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> likedItem(id) async {
    try {
      var decodedData = ApiHelper.postLike(
          endPoint: "recipe/$id/like/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> onUnlike(id) async {
    try {
      var decodedData = ApiHelper.delete(
          endPoint: "recipe/$id/like/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchComments(id) async {
    try {
      var decodedData = ApiHelper.getDataWithoutStatus(
          endPoint: "recipe/$id/comment/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> postComment(id,data) async {

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
      var decodedData = ApiHelper.postData(
          endPoint: "recipe/$id/comment/",
          body: data,
          header: {"Authorization": "Bearer $accessToken"});
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> postBookmark(String authorid, Map<String, String> data) async{
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
      var decodedData = ApiHelper.postData(
          endPoint: "user/profile/$authorid/bookmarks/",
          body: data,
          header: {"Authorization": "Bearer $accessToken"});
      return decodedData;
    } catch (e) {
      log("$e");
    } 
  }
}

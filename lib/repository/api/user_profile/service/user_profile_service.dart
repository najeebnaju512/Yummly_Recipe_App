import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';

class UserProfileService {
  static Future<dynamic> fetchUserAvatar() async {
    log("UserProfileService -> fetchUserAvatar()");
    try {
      var decodedData = await ApiHelper.getDataWithoutStatus(
          endPoint: "user/profile/avatar/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchUserNameEmail() async {
    log("UserProfileService -> fetchUserNameEmail()");
    try {
      var decodedData = await ApiHelper.getDataWithoutStatus(
          endPoint: "user/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchUserRecipe() async {
    log("UserProfileService -> fetchUserRecipe()");
    try {
      var decodedData = await ApiHelper.getDataWithoutStatus(
          endPoint: "recipe/my-recipes/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future fetchFollower() async {
    try {
      log("UserProfileService -> fetchFollower()");
      var decodedData = await ApiHelper.getData(
          endPoint: "followers/followers-list/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodedData;
    } catch (e) {
      log(">>>>>><<<<<>>>$e");
    }
  }
}

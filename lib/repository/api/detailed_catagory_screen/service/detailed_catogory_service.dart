import 'dart:developer';

import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/helper/api_helper.dart';

class DetailedCatogoryService {
  static Future<dynamic> fetchCatogorylist(tag) async {
    try {
      var decodeData = await ApiHelper.getDataWithoutStatus(
          endPoint: "recipe/category-feed/?limit=5&start=0&tag=$tag",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      return decodeData;
    } catch (e) {
      log("$e");
    }
  }
}

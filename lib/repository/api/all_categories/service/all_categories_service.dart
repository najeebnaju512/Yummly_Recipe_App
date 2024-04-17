import 'dart:developer';

import '../../../helper/api_helper.dart';

class AllCategoriesServiceScreen {
  static Future<dynamic> getCategoriesList() async {
    try {
      var decodedData = await ApiHelper.getData(endPoint: "recipe/get-categories-list/");
      log('service=>' + decodedData.toString());
      if (decodedData != null && decodedData["status"] == 1) {
        log("Data fetched successfully");
        return decodedData;
      } else {
        log("Failed to fetch data: ${decodedData?["status"]}");
        return decodedData;
      }
    } catch (e) {
      log("Error fetching data: $e");
      return null;
    }
  }
}
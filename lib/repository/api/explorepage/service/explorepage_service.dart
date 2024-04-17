import 'dart:developer';

import '../../../helper/api_helper.dart';

class ExpolrePageService {
  static Future<dynamic> fetchDetails(searchList) async {
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "recipe/yummly-search/?query=$searchList&start=0");
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

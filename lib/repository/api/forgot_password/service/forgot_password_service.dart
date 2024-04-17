import 'dart:developer';

import 'package:recipe_app/repository/helper/api_helper.dart';

class ForgotPasswordService {
  static Future<dynamic> ForgotPassword(Map<String, String> data) async {
    try {
      var decodedData =
          await ApiHelper.postRegisterData(endPoint: "user/password/reset/", body: data);
      // var msg = decodedData["msg"];
      if (decodedData["status"] == "OK") {
        log("forgot password service success");
        return decodedData;
      } else {
        log("forgot password service failed");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}

import 'dart:developer';

import 'package:recipe_app/repository/helper/api_helper.dart';

class RegistrationService {
  static Future<dynamic> postRegistration(Map<String, String> data) async {
    try {
      var encodedData =
          await ApiHelper.postRegisterData(endPoint: "user/register/", body: data);
      // var message = encodedData["msg"];
      if (encodedData["status"] == 1) {
        // log("$message");
        return encodedData;
      } else {
        // log(message);
        return encodedData;
      }
    } catch (e) {
      print(e);
    }
  }
}

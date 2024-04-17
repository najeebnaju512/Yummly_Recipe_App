import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/repository/api/login/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app_config/app_config.dart';
import '../../../core/app_utils.dart';
import '../../bottom_navigation/bottom_navigation_bar.dart';

class LoginController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  void onLogin(BuildContext context, String email, String password) {
    var data = {"email": email, "password": password};
    LoginService.postLogin(data).then((recData) {
      if (recData["status"] == 1) {
        var data = recData["data"];
        //var message = recData["msg"];
        // AppUtils.oneTimeSnackBar(message,
        //     txtColor: Colors.green, context: context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
            (route) => false);
        storeRecivedData(data);
      } else {
        var message = "Login Failed";
        AppUtils.oneTimeSnackBar(message,
            txtColor: Colors.red, context: context);
      }
      notifyListeners();
    });
  }

  storeRecivedData(data) async {
    log("storeRecivedData>>Logindata>> and stred status of login");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = json.encode(data);
    sharedPreferences.setString(AppConfig.loginData, storeData);
    sharedPreferences.setBool(AppConfig.status, true);
  }
}

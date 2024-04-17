import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/login/view/loginpage.dart';
import 'package:recipe_app/repository/api/forgot_password/service/forgot_password_service.dart';

class ForgotPasswordController extends ChangeNotifier {
  var isLoading = false;

  void onForgot(BuildContext context, String email) {
    var data = {"email": email};
    ForgotPasswordService.ForgotPassword(data).then((value) {
      // log("forgottpssword ${value["msg"]}");
      if ( value["status"]== "OK") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      }else{
        AppUtils.oneTimeSnackBar("failed", context: context);
      }

    });
  }
}

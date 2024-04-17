import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/saved/model/saved_model.dart';
import 'package:recipe_app/presentation/saved/service/saved_service.dart';

class SavedController extends ChangeNotifier {
  bool isLoading = false;
  SavedPageModel savedPageModel = SavedPageModel();

  fetchData(String id,context) {
    SavedPageService.fetchData(id).then((value) {
      savedPageModel = SavedPageModel.fromJson(value);
      // if (value["status" == 1]) {
      //   savedPageModel = SavedPageModel.fromJson(value);
      // } else {
      //   AppUtils.oneTimeSnackBar("Failed", context: context);
      // }
      notifyListeners();
    });
  }
}

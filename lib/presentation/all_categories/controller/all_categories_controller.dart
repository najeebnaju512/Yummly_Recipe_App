import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/api/all_categories/modal/all_categories_modal.dart';

import '../../../repository/api/all_categories/service/all_categories_service.dart';

class AllCategoriesScreenController with ChangeNotifier {
  CategoryModel categoryModel =
      CategoryModel(); // Initialize with an empty model

  bool isLoading = false;

  fetchCategoriesList(context) async {
    isLoading = true;
    notifyListeners();
    AllCategoriesServiceScreen.getCategoriesList().then((value) {
      if (value["status"] == 1) {
        log("AllCategoriesScreenController -> AllCategoriesServiceScreen -> data -> ${value["data"]}");
        categoryModel = CategoryModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}

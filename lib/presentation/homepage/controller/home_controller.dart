import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../repository/api/homepage/model/home_model.dart';
import '../../../repository/api/homepage/service/home_service.dart';

class HomeController with ChangeNotifier {
  late HomeModel homeModel = HomeModel();
  bool isLoading = false;

  Future<void> startFn() async {
    await fetchData();
  }

   fetchData() async {
    isLoading = true;
    notifyListeners();
    try {
      var recData = await HomeService.fetchRecipe();
      log("${recData["status"]}");
      if (recData["status"] == 1) {
        homeModel = HomeModel.fromJson(recData["data"]);
        isLoading = false;
      } else {
        log("else condition in controller");
      }
      notifyListeners();
    } catch (e) {
      log("$e");
      throw e;
    }
  }
}
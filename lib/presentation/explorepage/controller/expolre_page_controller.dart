import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/api/explorepage/modal/explorepage_modal.dart';

import '../../../repository/api/explorepage/service/explorepage_service.dart';

class ExplorePageController with ChangeNotifier {
  late ExploreModal exploreModal = ExploreModal();
  bool isLoading = false;

  fetchData(
    context, {
    String? searchList,
  }) async {
    isLoading = true;
    notifyListeners();
    ExpolrePageService.fetchDetails(searchList).then((value) {
      if (value['status'] == 1) {
        log("explorepage controller=> Allexploreservice-> data${value["data"]}");
        exploreModal = ExploreModal.fromJson(value);
        isLoading = false;
      } else {
        // AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}

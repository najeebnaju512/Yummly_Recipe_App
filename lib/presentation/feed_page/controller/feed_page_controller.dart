import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/repository/api/feed_page/model/comment_model.dart';

import '../../../repository/api/feed_page/model/feed_page_model.dart';
import '../../../repository/api/feed_page/service/feed_page_service.dart';

class FeedPageController extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingComments = false;
  FeedModel feedModel = FeedModel();
  CommentsModel commentsModel = CommentsModel();

  void fetchFeed(BuildContext context) {
    isLoading = true;
    notifyListeners();
    FeedPageService.fetchData().then((value) {
      if (value["status"] == 1) {
        feedModel = FeedModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Fetching Failed",
            context: context, bgColor: Colors.red);
      }
      notifyListeners();
    });
  }

  void likeTapped(id, context) {
    FeedPageService.likedItem(id).then((value) {
      log("================$value");
      if (value["status"] == 1) {
        AppUtils.oneTimeSnackBar(value["message"], context: context);
      } else {
        AppUtils.oneTimeSnackBar(value["message"],
            context: context, bgColor: Colors.redAccent);
      }
    });
  }

  void onUnlike(id, context) {
    FeedPageService.onUnlike(id).then((value) {
      if (value["status"] == 1) {
        AppUtils.oneTimeSnackBar(value["message"], context: context);
      } else {
        AppUtils.oneTimeSnackBar(value["message"],
            context: context, bgColor: Colors.redAccent);
      }
    });
  }

  fetchComments(id, context) {
    isLoadingComments = true;
    notifyListeners();
    FeedPageService.fetchComments(id).then((value) {
      if (value["status"] == 1) {
        commentsModel = CommentsModel.fromJson(value);
        isLoadingComments = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }

  void postComment(id, text, context) {
    var data = {"text": "$text"}; //TODO comment json
    FeedPageService.postComment(id, data).then((value) {
      if (value["status"] != 0) {
        AppUtils.oneTimeSnackBar("commented", context: context);
      } else {
        AppUtils.oneTimeSnackBar("error",
            context: context, bgColor: Colors.redAccent);
      }
      notifyListeners();
    });
  }

  void postBookmark(String authorid, String itemId, BuildContext context) {
    var data = {"id": itemId};
    FeedPageService.postBookmark(authorid, data).then((value) {
      if (value["status"] == 1) {
        AppUtils.oneTimeSnackBar("commented", context: context);
      } else {
        AppUtils.oneTimeSnackBar("error",
            context: context, bgColor: Colors.redAccent);
      }
      notifyListeners();
    });
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/repository/api/common_model/recipe_model.dart';
import 'package:recipe_app/repository/api/user_profile/model/follower_list_model.dart';
import 'package:recipe_app/repository/api/user_profile/model/user_avatar_model.dart';
import 'package:recipe_app/repository/api/user_profile/model/username_email_model.dart';
import 'package:recipe_app/repository/api/user_profile/service/user_profile_service.dart';

class UserProfileController extends ChangeNotifier {
  UserAvatarModel userAvatarModel = UserAvatarModel();
  UsernameEmailModel usernameEmailModel = UsernameEmailModel();
  RecipeModel recipeModel = RecipeModel();
  FollowerCountModel followerCountModel=FollowerCountModel();
  List<Follower>? followers;
  bool isLoading = false;
  bool isLoading2 = false;

  fetchUserAvatar() async {
    isLoading = true;
    notifyListeners();
    log("UserProfileController -> fetchUserAvatar()");
    UserProfileService.fetchUserAvatar().then((value) {
      if (value["status"] == 1) {
        userAvatarModel = UserAvatarModel.fromJson(value["data"]);
        isLoading = false;
      } else {}
      notifyListeners();
    });
  }

  fetchUserNameEmail() async {
    log("UserProfileController -> fetchUserNameEmail()");
    UserProfileService.fetchUserNameEmail().then((value) {
      if (value["status"] == 1) {
        usernameEmailModel = UsernameEmailModel.fromJson(value["data"]);
      } else {}
      notifyListeners();
    });
  }

  fetchUSerRecipe() async {
    log("UserProfileController -> fetchUSerRecipe()");
    UserProfileService.fetchUserRecipe().then((value) {
      if (value["status"] == 1) {
        recipeModel = RecipeModel.fromJson(value);
        log(">>>>>>>>>>>>>${recipeModel.data?.length}");
      } else {}
      notifyListeners();
    });
  }

   fetchFollowerList() async{
      log(">>>>>>>>> fetch followers");
    UserProfileService.fetchFollower().then((value) {
      if(value["status"]==1){
        followerCountModel= FollowerCountModel.fromJson(value);
          log("Follower count -> ${followerCountModel.followers?.length}");

      }else{
        log("else in controller");
       log(">>>>>>>>> else in controller");
      }
      notifyListeners();
    });
   }
}

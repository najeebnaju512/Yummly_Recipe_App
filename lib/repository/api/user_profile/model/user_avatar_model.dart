// To parse this JSON data, do
//
//     final userAvatarModel = userAvatarModelFromJson(jsonString);

import 'dart:convert';

UserAvatarModel userAvatarModelFromJson(String str) => UserAvatarModel.fromJson(json.decode(str));

String userAvatarModelToJson(UserAvatarModel data) => json.encode(data.toJson());

class UserAvatarModel {
  dynamic avatar;

  UserAvatarModel({
    this.avatar,
  });

  factory UserAvatarModel.fromJson(Map<String, dynamic> json) => UserAvatarModel(
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
  };
}

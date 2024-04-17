// To parse this JSON data, do
//
//     final usernameEmailModel = usernameEmailModelFromJson(jsonString);

import 'dart:convert';

UsernameEmailModel usernameEmailModelFromJson(String str) => UsernameEmailModel.fromJson(json.decode(str));

String usernameEmailModelToJson(UsernameEmailModel data) => json.encode(data.toJson());

class UsernameEmailModel {
  int? id;
  String? username;
  String? email;
  bool? isStaff;
  dynamic image;

  UsernameEmailModel({
    this.id,
    this.username,
    this.email,
    this.isStaff,
    this.image,
  });

  factory UsernameEmailModel.fromJson(Map<String, dynamic> json) => UsernameEmailModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    isStaff: json["is_staff"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "is_staff": isStaff,
    "image": image,
  };
}

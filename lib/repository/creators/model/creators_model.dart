// To parse this JSON data, do
//
//     final creatorsModel = creatorsModelFromJson(jsonString);

import 'dart:convert';

CreatorsModel creatorsModelFromJson(String str) => CreatorsModel.fromJson(json.decode(str));

String creatorsModelToJson(CreatorsModel data) => json.encode(data.toJson());

class CreatorsModel {
  int? status;
  List<User>? users;

  CreatorsModel({
    this.status,
    this.users,
  });

  factory CreatorsModel.fromJson(Map<String, dynamic> json) => CreatorsModel(
    status: json["status"],
    users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class User {
  int? id;
  String? username;
  String? email;

  User({
    this.id,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };
}

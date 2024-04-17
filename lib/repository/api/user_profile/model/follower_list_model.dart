// To parse this JSON data, do
//
//     final followerCountModel = followerCountModelFromJson(jsonString);

import 'dart:convert';

FollowerCountModel followerCountModelFromJson(String str) => FollowerCountModel.fromJson(json.decode(str));

String followerCountModelToJson(FollowerCountModel data) => json.encode(data.toJson());

class FollowerCountModel {
    int? status;
    List<Follower>? followers;

    FollowerCountModel({
        this.status,
        this.followers,
    });

    factory FollowerCountModel.fromJson(Map<String, dynamic> json) => FollowerCountModel(
        status: json["status"],
        followers: json["followers"] == null ? [] : List<Follower>.from(json["followers"]!.map((x) => Follower.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "followers": followers == null ? [] : List<dynamic>.from(followers!.map((x) => x.toJson())),
    };
}

class Follower {
    int? id;
    String? username;
    String? email;

    Follower({
        this.id,
        this.username,
        this.email,
    });

    factory Follower.fromJson(Map<String, dynamic> json) => Follower(
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

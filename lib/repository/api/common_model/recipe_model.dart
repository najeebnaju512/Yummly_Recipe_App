// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

RecipeModel recipeModelFromJson(String str) => RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  int? status;
  List<Datum>? data;

  RecipeModel({
    this.status,
    this.data,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? category;
  String? picture;
  String? title;
  String? desc;
  String? cookTime;
  List<String>? ingredients;
  List<String>? procedure;
  int? author;
  String? username;
  int? totalNumberOfLikes;
  int? totalNumberOfComments;
  int? totalNumberOfBookmarks;

  Datum({
    this.id,
    this.category,
    this.picture,
    this.title,
    this.desc,
    this.cookTime,
    this.ingredients,
    this.procedure,
    this.author,
    this.username,
    this.totalNumberOfLikes,
    this.totalNumberOfComments,
    this.totalNumberOfBookmarks,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    category: json["category"],
    picture: json["picture"],
    title: json["title"],
    desc: json["desc"],
    cookTime: json["cook_time"],
    ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
    procedure: json["procedure"] == null ? [] : List<String>.from(json["procedure"]!.map((x) => x)),
    author: json["author"],
    username: json["username"],
    totalNumberOfLikes: json["total_number_of_likes"],
    totalNumberOfComments: json["total_number_of_comments"],
    totalNumberOfBookmarks: json["total_number_of_bookmarks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "picture": picture,
    "title": title,
    "desc": desc,
    "cook_time": cookTime,
    "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
    "procedure": procedure == null ? [] : List<dynamic>.from(procedure!.map((x) => x)),
    "author": author,
    "username": username,
    "total_number_of_likes": totalNumberOfLikes,
    "total_number_of_comments": totalNumberOfComments,
    "total_number_of_bookmarks": totalNumberOfBookmarks,
  };
}

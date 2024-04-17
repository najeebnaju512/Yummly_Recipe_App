// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

CategoryModel recipeModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String recipeModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int? status;
  List<Datum>? data;

  CategoryModel({
    this.status,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? trackingId;
  String? displayName;
  String? categoryImage;
  String? tag;

  Datum({
    this.trackingId,
    this.displayName,
    this.categoryImage,
    this.tag,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    trackingId: json["tracking-id"],
    displayName: json["display name"],
    categoryImage: json["category image"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "tracking-id": trackingId,
    "display name": displayName,
    "category image": categoryImage,
    "tag": tag,
  };
}

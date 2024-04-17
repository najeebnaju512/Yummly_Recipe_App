// To parse this JSON data, do
//
//     final exploreModal = exploreModalFromJson(jsonString);

import 'dart:convert';

ExploreModal exploreModalFromJson(String str) => ExploreModal.fromJson(json.decode(str));

String exploreModalToJson(ExploreModal data) => json.encode(data.toJson());

class ExploreModal {
  int? status;
  List<Datum>? data;

  ExploreModal({
    this.status,
    this.data,
  });

  factory ExploreModal.fromJson(Map<String, dynamic> json) => ExploreModal(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? title;
  String? imageUrl;
  String? totalTime;
  Tags? tags;
  List<String>? preparationSteps;
  List<String>? ingredientLines;

  Datum({
    this.title,
    this.imageUrl,
    this.totalTime,
    this.tags,
    this.preparationSteps,
    this.ingredientLines,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    imageUrl: json["image_url"],
    totalTime: json["total_time"],
    tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
    preparationSteps: json["preparation_steps"] == null ? [] : List<String>.from(json["preparation_steps"]!.map((x) => x)),
    ingredientLines: json["ingredient_lines"] == null ? [] : List<String>.from(json["ingredient_lines"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image_url": imageUrl,
    "total_time": totalTime,
    "tags": tags?.toJson(),
    "preparation_steps": preparationSteps == null ? [] : List<dynamic>.from(preparationSteps!.map((x) => x)),
    "ingredient_lines": ingredientLines == null ? [] : List<dynamic>.from(ingredientLines!.map((x) => x)),
  };
}

class Tags {
  List<Course>? course;
  List<dynamic>? cuisine;
  List<dynamic>? holiday;
  List<Course>? technique;

  Tags({
    this.course,
    this.cuisine,
    this.holiday,
    this.technique,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    course: json["course"] == null ? [] : List<Course>.from(json["course"]!.map((x) => Course.fromJson(x))),
    cuisine: json["cuisine"] == null ? [] : List<dynamic>.from(json["cuisine"]!.map((x) => x)),
    holiday: json["holiday"] == null ? [] : List<dynamic>.from(json["holiday"]!.map((x) => x)),
    technique: json["technique"] == null ? [] : List<Course>.from(json["technique"]!.map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": course == null ? [] : List<dynamic>.from(course!.map((x) => x.toJson())),
    "cuisine": cuisine == null ? [] : List<dynamic>.from(cuisine!.map((x) => x)),
    "holiday": holiday == null ? [] : List<dynamic>.from(holiday!.map((x) => x)),
    "technique": technique == null ? [] : List<dynamic>.from(technique!.map((x) => x.toJson())),
  };
}

class Course {
  String? displayName;
  String? tagUrl;

  Course({
    this.displayName,
    this.tagUrl,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    displayName: json["display-name"],
    tagUrl: json["tag-url"],
  );

  Map<String, dynamic> toJson() => {
    "display-name": displayName,
    "tag-url": tagUrl,
  };
}

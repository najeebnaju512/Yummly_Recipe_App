// To parse this JSON data, do
//
//     final detailedCatagoryModel = detailedCatagoryModelFromJson(jsonString);

import 'dart:convert';

DetailedCatagoryModel detailedCatagoryModelFromJson(String str) => DetailedCatagoryModel.fromJson(json.decode(str));

String detailedCatagoryModelToJson(DetailedCatagoryModel data) => json.encode(data.toJson());

class DetailedCatagoryModel {
    int? status;
    List<Datum>? data;

    DetailedCatagoryModel({
        this.status,
        this.data,
    });

    factory DetailedCatagoryModel.fromJson(Map<String, dynamic> json) => DetailedCatagoryModel(
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
    String? description;
    String? image;
    List<String>? ingredients;
    List<String>? preparationSteps;
    List<String>? course;
    List<String>? difficulty;
    List<String>? nutrition;
    List<String>? technique;
    String? totalTime;
    double? rating;
    String? author;

    Datum({
        this.title,
        this.description,
        this.image,
        this.ingredients,
        this.preparationSteps,
        this.course,
        this.difficulty,
        this.nutrition,
        this.technique,
        this.totalTime,
        this.rating,
        this.author,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
        preparationSteps: json["preparationSteps"] == null ? [] : List<String>.from(json["preparationSteps"]!.map((x) => x)),
        course: json["course"] == null ? [] : List<String>.from(json["course"]!.map((x) => x)),
        difficulty: json["difficulty"] == null ? [] : List<String>.from(json["difficulty"]!.map((x) => x)),
        nutrition: json["nutrition"] == null ? [] : List<String>.from(json["nutrition"]!.map((x) => x)),
        technique: json["technique"] == null ? [] : List<String>.from(json["technique"]!.map((x) => x)),
        totalTime: json["total_time"],
        rating: json["rating"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
        "preparationSteps": preparationSteps == null ? [] : List<dynamic>.from(preparationSteps!.map((x) => x)),
        "course": course == null ? [] : List<dynamic>.from(course!.map((x) => x)),
        "difficulty": difficulty == null ? [] : List<dynamic>.from(difficulty!.map((x) => x)),
        "nutrition": nutrition == null ? [] : List<dynamic>.from(nutrition!.map((x) => x)),
        "technique": technique == null ? [] : List<dynamic>.from(technique!.map((x) => x)),
        "total_time": totalTime,
        "rating": rating,
        "author": author,
    };
}

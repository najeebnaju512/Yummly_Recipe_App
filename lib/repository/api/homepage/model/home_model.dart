// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    List<Datum>? data;

    HomeModel({
        this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? name;
    String? image;
    String? totalTime;
    List<String>? preparationSteps;
    List<String>? ingredients;
    double? rating;

    Datum({
        this.name,
        this.image,
        this.totalTime,
        this.preparationSteps,
        this.ingredients,
        this.rating,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        image: json["image"],
        totalTime: json["totalTime"],
        preparationSteps: json["preparationSteps"] == null ? [] : List<String>.from(json["preparationSteps"]!.map((x) => x)),
        ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "totalTime": totalTime,
        "preparationSteps": preparationSteps == null ? [] : List<dynamic>.from(preparationSteps!.map((x) => x)),
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
        "rating": rating,
    };
}

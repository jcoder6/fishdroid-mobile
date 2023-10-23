// To parse this JSON data, do
//
//     final nutriList = nutriListFromJson(jsonString);

import 'dart:convert';

List<NutriList> nutriListFromJson(String str) => List<NutriList>.from(json.decode(str).map((x) => NutriList.fromJson(x)));

String nutriListToJson(List<NutriList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NutriList {
    int id;
    int fishId;
    String nutritionName;

    NutriList({
        required this.id,
        required this.fishId,
        required this.nutritionName,
    });

    factory NutriList.fromJson(Map<String, dynamic> json) => NutriList(
        id: json["id"],
        fishId: json["fish_id"],
        nutritionName: json["nutrition_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fish_id": fishId,
        "nutrition_name": nutritionName,
    };
}

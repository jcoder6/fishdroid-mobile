// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

List<Recipe> recipeFromJson(String str) => List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
    int id;
    int? fishId;
    String recipeName;
    String? recipeSteps;
    String recipeImg;
    String fishName;
    String? fishImage;

    Recipe({
        required this.id,
        this.fishId,
        required this.recipeName,
        this.recipeSteps,
        required this.recipeImg,
        required this.fishName,
        this.fishImage,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        fishId: json["fish_id"],
        recipeName: json["recipe_name"],
        recipeSteps: json["recipe_steps"],
        recipeImg: json["recipe_img"],
        fishName: json["fish_name"],
        fishImage: json["fish_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fish_id": fishId,
        "recipe_name": recipeName,
        "recipe_steps": recipeSteps,
        "recipe_img": recipeImg,
        "fish_name": fishName,
        "fish_image": fishImage,
    };
}

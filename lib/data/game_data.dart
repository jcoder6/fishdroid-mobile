// To parse this JSON data, do
//
//     final gameData = gameDataFromJson(jsonString);

import 'dart:convert';

GameData gameDataFromJson(String str) => GameData.fromJson(json.decode(str));

String gameDataToJson(GameData data) => json.encode(data.toJson());

class GameData {
    int id;
    String quizAnswer;
    String quizHint;
    String quizImage;

    GameData({
        required this.id,
        required this.quizAnswer,
        required this.quizHint,
        required this.quizImage,
    });

    factory GameData.fromJson(Map<String, dynamic> json) => GameData(
        id: json["id"],
        quizAnswer: json["quiz_answer"],
        quizHint: json["quiz_hint"],
        quizImage: json["quiz_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_answer": quizAnswer,
        "quiz_hint": quizHint,
        "quiz_image": quizImage,
    };
}
// To parse this JSON data, do
//
//     final triviaData = triviaDataFromJson(jsonString);

import 'dart:convert';

TriviaData triviaDataFromJson(String str) => TriviaData.fromJson(json.decode(str));

String triviaDataToJson(TriviaData data) => json.encode(data.toJson());

class TriviaData {
    int id;
    String trivia;
    String triviaVideo;

    TriviaData({
        required this.id,
        required this.trivia,
        required this.triviaVideo,
    });

    factory TriviaData.fromJson(Map<String, dynamic> json) => TriviaData(
        id: json["id"],
        trivia: json["trivia"],
        triviaVideo: json["trivia_video"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "trivia": trivia,
        "trivia_video": triviaVideo,
    };
}

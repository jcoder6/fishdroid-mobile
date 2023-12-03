// To parse this JSON data, do
//
//     final hatchVideoData = hatchVideoDataFromJson(jsonString);

import 'dart:convert';

List<HatchVideoData> hatchVideoDataFromJson(String str) => List<HatchVideoData>.from(json.decode(str).map((x) => HatchVideoData.fromJson(x)));

String hatchVideoDataToJson(List<HatchVideoData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HatchVideoData {
    int id;
    int fishId;
    int phaseNum;
    String videoLink;

    HatchVideoData({
        required this.id,
        required this.fishId,
        required this.phaseNum,
        required this.videoLink,
    });

    factory HatchVideoData.fromJson(Map<String, dynamic> json) => HatchVideoData(
        id: json["id"],
        fishId: json["fish_id"],
        phaseNum: json["phase_num"],
        videoLink: json["video_link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fish_id": fishId,
        "phase_num": phaseNum,
        "video_link": videoLink,
    };
}

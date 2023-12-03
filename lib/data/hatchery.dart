// To parse this JSON data, do
//
//     final hatcheryData = hatcheryDataFromJson(jsonString);

import 'dart:convert';

List<HatcheryData> hatcheryDataFromJson(String str) => List<HatcheryData>.from(json.decode(str).map((x) => HatcheryData.fromJson(x)));

String hatcheryDataToJson(List<HatcheryData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HatcheryData {
    int id;
    String fishName;
    String hatchProcess;

    HatcheryData({
        required this.id,
        required this.fishName,
        required this.hatchProcess,
    });

    factory HatcheryData.fromJson(Map<String, dynamic> json) => HatcheryData(
        id: json["id"],
        fishName: json["fish_name"],
        hatchProcess: json["hatch_process"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fish_name": fishName,
        "hatch_process": hatchProcess,
    };
}

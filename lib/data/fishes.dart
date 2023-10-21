// To parse this JSON data, do
//
//     final fish = fishFromJson(jsonString);

import 'dart:convert';

List<Fish> fishFromJson(String str) => List<Fish>.from(json.decode(str).map((x) => Fish.fromJson(x)));

String fishToJson(List<Fish> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fish {
    int id;
    String fishName;
    String scientificName;
    int familyNameId;
    String localName;
    String fishImage;
    String fishInfo;
    String familyName;

    Fish({
        required this.id,
        required this.fishName,
        required this.scientificName,
        required this.familyNameId,
        required this.localName,
        required this.fishImage,
        required this.fishInfo,
        required this.familyName,
    });

    factory Fish.fromJson(Map<String, dynamic> json) => Fish(
        id: json["id"],
        fishName: json["fish_name"],
        scientificName: json["scientific_name"],
        familyNameId: json["family_name_id"],
        localName: json["local_name"],
        fishImage: json["fish_image"],
        fishInfo: json["fish_info"],
        familyName: json["family_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fish_name": fishName,
        "scientific_name": scientificName,
        "family_name_id": familyNameId,
        "local_name": localName,
        "fish_image": fishImage,
        "fish_info": fishInfo,
        "family_name": familyName,
    };
}

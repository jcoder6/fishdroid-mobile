// To parse this JSON data, do
//
//     final term = termFromJson(jsonString);

import 'dart:convert';

List<Term> termFromJson(String str) => List<Term>.from(json.decode(str).map((x) => Term.fromJson(x)));

String termToJson(List<Term> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Term {
    int id;
    String techTerm;
    String techDesc;
    String termImg;

    Term({
        required this.id,
        required this.techTerm,
        required this.techDesc,
        required this.termImg,
    });

    factory Term.fromJson(Map<String, dynamic> json) => Term(
        id: json["id"],
        techTerm: json["tech_term"],
        techDesc: json["tech_desc"],
        termImg: json["term_img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tech_term": techTerm,
        "tech_desc": techDesc,
        "term_img": termImg,
    };
}

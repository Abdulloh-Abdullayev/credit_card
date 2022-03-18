// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.name,
    required this.relative,
    required this.number,
    required this.id,
  });

  String name;
  String relative;
  String number;
  String id;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    relative: json["relative"],
    number: json["number"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "relative": relative,
    "number": number,
    "id": id,
  };
}
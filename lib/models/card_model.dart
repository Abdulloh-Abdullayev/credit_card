// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.cardNumber,
    required this.data,
    required this.cvv,
    required this.id,
  });

  String cardNumber;
  String data;
  String cvv;
  String id;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    cardNumber: json["cardNumber"],
    data: json["data"],
    cvv: json["cvv"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "cardNumber": cardNumber,
    "data": data,
    "cvv": cvv,
    "id": id,
  };
}

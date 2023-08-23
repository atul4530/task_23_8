// To parse this JSON data, do
//
//     final dogModel = dogModelFromJson(jsonString);

import 'dart:convert';

DogModel dogModelFromJson(String str) => DogModel.fromJson(json.decode(str));

String dogModelToJson(DogModel data) => json.encode(data.toJson());

class DogModel {
  String? message;
  String? status;

  DogModel({
    this.message,
    this.status,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}

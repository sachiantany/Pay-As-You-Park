// To parse this JSON data, do
//
//     final getLocationModel = getLocationModelFromJson(jsonString);

import 'dart:convert';

GetLocationModel getLocationModelFromJson(String str) =>
    GetLocationModel.fromJson(json.decode(str));

String getLocationModelToJson(GetLocationModel data) =>
    json.encode(data.toJson());

class GetLocationModel {
  GetLocationModel({
    this.id,
    this.user,
    this.distanceX,
    this.distanceY,
    this.v,
  });

  String id;
  String user;
  String distanceX;
  String distanceY;
  int v;

  factory GetLocationModel.fromJson(Map<String, dynamic> json) =>
      GetLocationModel(
        id: json["_id"],
        user: json["user"],
        distanceX: json["distanceX"],
        distanceY: json["distanceY"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "distanceX": distanceX,
        "distanceY": distanceY,
        "__v": v,
      };
}

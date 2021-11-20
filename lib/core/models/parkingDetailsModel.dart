// To parse this JSON data, do
//
//     final userParkingDetails = userParkingDetailsFromJson(jsonString);

import 'dart:convert';

UserParkingDetails userParkingDetailsFromJson(String str) =>
    UserParkingDetails.fromJson(json.decode(str));

String userParkingDetailsToJson(UserParkingDetails data) =>
    json.encode(data.toJson());

class UserParkingDetails {
  UserParkingDetails({
    // required this.id,
    required this.user,
    required this.inTime,
    required this.outTime,
    required this.v,
  });

  //String id;
  String user;
  DateTime inTime;
  DateTime outTime;
  int v;

  factory UserParkingDetails.fromJson(Map<String, dynamic> json) =>
      UserParkingDetails(
        // id: json["_id"],
        user: json["user"],
        inTime: DateTime.parse(json["inTime"]),
        outTime: DateTime.parse(json["outTime"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        // "_id": id,
        "user": user,
        "inTime": inTime.toIso8601String(),
        "outTime": outTime.toIso8601String(),
        "__v": v,
      };
}

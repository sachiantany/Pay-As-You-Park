// To parse this JSON data, do
//
//     final getSlotsModel = getSlotsModelFromJson(jsonString);

import 'dart:convert';

GetSlotsModel getSlotsModelFromJson(String str) =>
    GetSlotsModel.fromJson(json.decode(str));

String getSlotsModelToJson(GetSlotsModel data) => json.encode(data.toJson());

class GetSlotsModel {
  GetSlotsModel({
    this.pid,
    this.name,
    this.occupancy,
    this.slots,
  });

  String pid;
  String name;
  String occupancy;
  Slots slots;

  factory GetSlotsModel.fromJson(Map<String, dynamic> json) => GetSlotsModel(
        pid: json["PID"],
        name: json["Name"],
        occupancy: json["Occupancy"],
        slots: Slots.fromJson(json["Slots"]),
      );

  Map<String, dynamic> toJson() => {
        "PID": pid,
        "Name": name,
        "Occupancy": occupancy,
        "Slots": slots.toJson(),
      };
}

class Slots {
  Slots({
    this.sid,
    this.availability,
  });

  String sid;
  bool availability;

  factory Slots.fromJson(Map<String, dynamic> json) => Slots(
        sid: json["sid"],
        availability: json["availability"],
      );

  Map<String, dynamic> toJson() => {
        "sid": sid,
        "availability": availability,
      };
}

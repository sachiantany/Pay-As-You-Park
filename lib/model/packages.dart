import 'dart:convert';


List<Packages> modelPackagesFromJson(String str) => List<Packages>.from(json.decode(str).map((x) => Packages.fromJson(x)));
String modelPackagesToJson(List<Packages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Packages{
  final String  name,id;
  final int minutes, price, bonus;

  Packages({required this.id,required this.name,required this.minutes,required this.price,required this.bonus});

  factory Packages.fromJson(Map<dynamic, dynamic> json){
    return new Packages(
        id:json['_id'],
        name:json['name'],
        minutes:json['minutes'],
        price:json['price'],
        bonus:json['bonus']
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "minutes": minutes,
    "_id": id,
    "price": price,
    "balance": bonus,
  };

}
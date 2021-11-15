import 'dart:convert';


List<Subscription> modelSubscriptionFromJson(String str) => List<Subscription>.from(json.decode(str).map((x) => Subscription.fromJson(x)));
String modelSubscriptionToJson(List<Subscription> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subscription{
  final String user_email, package_name,id;
  final int minute, price, balance;

  Subscription({required this.id,required this.user_email,required this.package_name,required this.minute,required this.price,required this.balance});

  factory Subscription.fromJson(Map<dynamic, dynamic> json){
    return new Subscription(
        id:json['_id'],
        user_email:json['user_email'],
        package_name:json['package_name'],
        minute:json['minute'],
        price:json['price'],
        balance:json['balance']
    );
  }

  Map<String, dynamic> toJson() => {
    "user_email": user_email,
    "package_name": package_name,
    "minute": minute,
    "_id": id,
    "price": price,
    "balance": balance,
  };

}
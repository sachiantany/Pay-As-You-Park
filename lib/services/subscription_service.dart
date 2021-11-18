import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pay_as_you_park/constants/strings.dart';

class SubscriptionService{
  Dio dio = new Dio();

  getSubscriptionHistory(user_email) async {
    try {
      return await dio.get(Strings.endPoint + 'subscription/'+user_email
      );
    }
    on DioError catch (e) {

    }
  }

  subscribe(user_email,package_name,minute, price,balance) async {
    try{
      print(user_email);
      return await dio.post(Strings.endPoint+'subscription/subscribe',data: {
        "user_email": user_email,
        "package_name": package_name,
        "minute": minute,
        "balance": balance,
        "price": price,
      },options: Options(contentType: Headers.formUrlEncodedContentType)
      ).then((val){
        if(val.data['result'] != null){
          print('success');
        }else{
          print('fail');
        }
      }).catchError((e) {
        print('exception');
        print(e);
      });
    }
    on DioError catch(e){

    }
  }
}
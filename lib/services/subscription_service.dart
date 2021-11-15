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

  registerDriver(first_name,last_name,email, password,vehicle_registration_no,vehicle_width,vehicle_length,vehicle_heigth) async {
    try{
      return await dio.post(Strings.endPoint+'driver/signup',data: {
        "first_name" : first_name,
        "email" : email,
        "password" : password,
        "last_name" : last_name,
        "vehicle_registration_no" : vehicle_registration_no,
        "vehicle_width" : vehicle_width,
        "vehicle_length" : vehicle_length,
        "vehicle_height" : vehicle_length
      },options: Options(contentType: Headers.formUrlEncodedContentType)
      );
    }
    on DioError catch(e){

    }
  }
}
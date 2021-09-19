import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pay_as_you_park/constants/strings.dart';

class DriverService{
  Dio dio = new Dio();

  login(email, password) async {
    try{
      return await dio.post('https://pay-as-you-park-mobile-server.herokuapp.com/driver/signin',data: {
        "email" : email,
        "password" : password
      },options: Options(contentType: Headers.formUrlEncodedContentType)
      );
    }
    on DioError catch(e){

    }
  }
}
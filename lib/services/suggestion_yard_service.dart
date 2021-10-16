import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pay_as_you_park/constants/strings.dart';

class SuggestionYardService{
  Dio dio = new Dio();

  Future getParkingYardSuggestion(lat, lon,length,width,height) async{
    try {
      print('................level 2...................');
      Map<String, String> queryParameters = {
        "user_lat": lat.toString(),
        "user_lon": lon.toString(),
        "user_max_width":width.toString(),
        "user_max_length":length.toString(),
        "user_max_height":height.toString(),
      };
      return await dio.get(Strings.aws_endpoint + 'test-route/', queryParameters: queryParameters);
    }
    on DioError catch (e) {
      print('.....................................error................................');
      print(e.message);
    }
  }

}
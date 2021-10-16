import 'dart:convert';

import 'package:custom_zoomable_floorplan/core/models/getLocationModel.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Service {
  Dio dio = new Dio();

  Future<dynamic> getIndoorLocation() async {
    String url = 'https://pay-as-you-park-mobile-server.herokuapp.com/indoor';
    Response response;
    List<dynamic> locationDetails = [];
    response = await dio.get(url);

    //print(response.data[0]["distanceX"]);
    var length = response.data.length;
    // Check if response is successful
    if (response.statusCode == 200) {
      for (var i = 0; i < length; i++) {
        locationDetails.add(response.data[i]);
      }
      print(locationDetails);
      return locationDetails;
    }
    return null;
  }

  Future<GetLocationModel> getIndoorLocationDetails() async {
    String url = 'https://pay-as-you-park-mobile-server.herokuapp.com/indoor';
    Response response;
    var locationModel = null;

    try {
      response = await dio.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.data;
        var jsonMap = jsonDecode(jsonString);
        locationModel = GetLocationModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return locationModel;
    }
    return locationModel;
  }
}

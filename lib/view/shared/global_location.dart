import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:custom_zoomable_floorplan/service/getLocation_service.dart';

abstract class GlobalLocation {
  // static String distanceX = Service().getIndoorLocation();
  var distanceOfX = [];
  var distanceOfY = [];
  static Future<dynamic> responseList = Service().getIndoorLocation();

  // List<dynamic> setUserLocation(){
  //   for(var i = 0; i < responseList.toString().length; i++){
  //     distanceOfX.add(responseList.data)
  //   }
  // }

  // static final distanceX = response.then((value) => value[0]["distanceX"]);

  // final distanceY = response.then((value) => value[0]["distanceY"]);

  static const List<double> userLocationX = [0.0, -0.05];
  static const List<double> userLocationY = [
    0.3,
    0.2,
    0.1,
    0.0,
    -0.1,
    -0.2,
    -0.3,
  ];

  static const Color blue = const Color(0xff4A64FE);
  static List locations = [
    {
      'nameLocation': 'User',
      'positionLocation': [userLocationX[0], userLocationY[6]],
      'tileLocation': 1
    }
  ];

  // static List locations = [
  //   {
  //     'nameLocation': 'User',
  //     'positionLocation': [userLocationX[0], userLocationY[1]],
  //     'tileLocation': 1
  //   }
  // ];
}

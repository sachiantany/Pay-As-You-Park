import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:custom_zoomable_floorplan/service/getLocation_service.dart';

abstract class GlobalLocation {
  // static String distanceX = Service().getIndoorLocation();
  // var distanceOfX = [];
  // var distanceOfY = [];
  // static Future<dynamic> responseList = Service().getIndoorLocation();

  // List<dynamic> setUserLocation(){
  //   for(var i = 0; i < responseList.toString().length; i++){
  //     distanceOfX.add(responseList.data)
  //   }
  // }

  // static final distanceX = response.then((value) => value[0]["distanceX"]);

  // final distanceY = response.then((value) => value[0]["distanceY"]);

  var response = Service().getIndoorLocationDetails();
  print(response);
  static const List<double> userLocationX = [0.0];
  static const List<double> userLocationY = [
    0.3,
    0.2,
    0.1,
    0.0,
    -0.1,
    -0.17, //to A04
    -0.3, //to A01
  ];

  static const Color blue = const Color(0xff4A64FE);
  static List locations = [
    {
      'nameLocation': 'User',
      'positionLocation': [userLocationX[0], userLocationY[0]],
      'tileLocation': 1
    }
  ];

  // for (var i = 0; i < userLocationX.length; i++)
  //         {print(i),
  //       userLocationY[6]}

  // static const Color blue = const Color(0xff4A64FE);
  // static List locations = [
  //   for (var i = 0; i < userLocationX.length; i++)
  //     {
  //       'nameLocation': 'User',
  //       'positionLocation': [userLocationX[0], userLocationY[0]],
  //       'tileLocation': 1
  //     }
  // ];

  notifyListeners();

  // static List locations = [
  //   {
  //     'nameLocation': 'User',
  //     'positionLocation': [userLocationX[0], userLocationY[1]],
  //     'tileLocation': 1
  //   }
  // ];
}

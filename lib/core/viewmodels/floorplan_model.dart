import 'dart:async';

import 'package:pay_as_you_park/core/models/location_model.dart';
import 'package:pay_as_you_park/core/models/models.dart';
import 'package:pay_as_you_park/core/models/parkingDetailsModel.dart';
import 'package:pay_as_you_park/view/shared/global.dart';
import 'package:pay_as_you_park/view/shared/global_location.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:async/async.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Pos {
  double x = 0.0;
  double y = 0.0;

  Pos(x, y) {
    this.x = x;
    this.y = y;
  }
}

class FloorPlanModel extends ChangeNotifier {
  double _scale = 2.0;
  double _previousScale = 2.0;
  Pos _pos = Pos(0.0, 0.0);
  Pos _previousPos = Pos(0.0, 0.0);
  Pos _endPos = Pos(0.0, 0.0);
  bool _isScaled = false;
  static double _userX = 0.0;
  static double _userY = 0.3;
  late double positionX;
  late double positionY;
  late int actualX;
  late int actualY;
  late int lengthX;
  late int lengthY;
  int convertionConstantY = 730;
  int convertionConstantX = 907;
  bool destination_slot_reached = false;

  static double get userX => _userX;
  static double get userY => _userY;

  double get scale => _scale;
  double get previousScale => _previousScale;
  Pos get pos => _pos;
  Pos get previousPos => _previousPos;
  Pos get endPos => _endPos;
  bool get isScaled => _isScaled;

  bool _hasTouched = false;
  bool get hasTouched => _hasTouched;
  set hasTouched(value) {
    _hasTouched = value;
    notifyListeners();
  }

  List<Slot> _slots = Global.slots.map((item) => Slot.fromMap(item)).toList();
  List<Slot> get slots => _slots;

  List<Location> _location = getUserLocation(userX, userY)
      .map((item) => Location.fromMap(item))
      .toList();
  notifyListeners();
  List<Location> get locations => _location;

  void handleDragScaleStart(ScaleStartDetails details) {
    _hasTouched = true;
    _previousScale = _scale;
    _previousPos.x = (details.focalPoint.dx / _scale) - _endPos.x;
    _previousPos.y = (details.focalPoint.dy / _scale) - _endPos.y;
    notifyListeners();
  }

  void handleDragScaleUpdate(ScaleUpdateDetails details) {
    _scale = _previousScale * details.scale;
    if (_scale > 4.0) {
      _isScaled = true;
    } else {
      _isScaled = false;
    }

    if (_scale < 2.0) {
      _scale = 2.0;
    } else if (_scale > 8.0) {
      _scale = 8.0;
    } else if (_previousScale == _scale) {
      _pos.x = (details.focalPoint.dx / _scale) - _previousPos.x;
      _pos.y = (details.focalPoint.dy / _scale) - _previousPos.y;
    }
    notifyListeners();
  }

  // static const List<double> userLocationX = [0.0];
  // static const List<double> userLocationY = [
  //   0.3,
  //   0.2,
  //   0.1,
  //   0.0,
  //   -0.1,
  //   -0.17, //to A04
  //   -0.3, //to A01
  // ];

  static List getUserLocation(userLocX, userLocY) {
    List userLocation = [
      {
        'nameLocation': 'User',
        'positionLocationX': userLocX,
        'positionLocationY': userLocY,
        'tileLocation': 1
      }
    ];

    return userLocation;
  }

  //Get converted Image Positions

  double getPositionX(lengthX, actualX) {
    double x;
    x = actualX.toDouble();

    positionX = ((actualX) - (lengthX / 2));
    print(positionX);

    double imagePositionX = positionX / convertionConstantX;
    // print(imagePositionX);
    return imagePositionX;
  }

  double getPositionY(lengthY, actualY) {
    double y;
    y = actualY.toDouble();

    if (y == lengthY / 2) {
      positionY = ((actualY) - (lengthY / 2));
    } else if (y < lengthY / 2) {
      positionY = -((actualY) - (lengthY / 2));
    } else {
      positionY = -((actualY) - (lengthY / 2));
    }

    double imagePositionY = positionY / convertionConstantY;
    // print(imagePositionY);
    return imagePositionY;
  }

  var i = 0;
  var j = 0;
  Dio dio = new Dio();

  Future<UserParkingDetails> createParkingDetails(
      String user, String inTime, String outTime) async {
    final String createParkingDetailsUrl =
        "https://pay-as-you-park-mobile-server.herokuapp.com/parked";

    Response response = await dio.post(createParkingDetailsUrl,
        data: {"user": user, "inTime": inTime, "outTime": outTime});

    if (response.statusCode == 201) {
      final responseStringParking = response.data;
      // print("Inside 201");
      return userParkingDetailsFromJson(responseStringParking);
    } else {
      final errorMsg = null;
      return errorMsg;
    }
  }

  void reset() async {
    const List<int> userLocationY = [
      0,
      50,
      60,
      70,
      100,
      150, //to A04>
      220,
      240,
      290,
      300,
      320,
      350,
      400,
      420,
      439 //to A01
    ];
    // int userActualPositionX = 137;

    int userValidationPositionX = 274;
    int userActualPositionX = 137;

    int userValidationPositionY = 438;
    int userActualPositionY = userLocationY[i];

    if (userValidationPositionY <= userActualPositionY) {
      userValidationPositionY = 438;
    } else {
      userValidationPositionY = userActualPositionY;
    }

    if (userValidationPositionX <= userActualPositionX) {
      userValidationPositionX = 274;
    } else {
      userValidationPositionX = userActualPositionX;
    }

    double userImagePositionX = getPositionX(274, userValidationPositionX);
    double userImagePositionY = getPositionY(438, userValidationPositionY);
    _scale = 2.0;
    _previousScale = 2.0;
    _pos = Pos(0.0, 0.0);
    _previousPos = Pos(0.0, 0.0);
    _endPos = Pos(0.0, 0.0);
    _isScaled = false;
    _userX = userImagePositionX;
    _userY = userImagePositionY;
    int length = userLocationY.length;
    if (i == length - 1) {
      double maxPosX = getPositionX(274, 100);
      _location = getUserLocation(maxPosX, _userY)
          .map((item) => Location.fromMap(item))
          .toList();
      notifyListeners();
      Fluttertoast.showToast(
          msg: "Reached the destination",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      String inTime = DateFormat('yyyy-MM-dd HH:mm:ss')
          .format(DateTime.now()); //2021-11-20 11:20:20

      String user = "appUser2";
      String outTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      //final UserParkingDetails userParkingDetails =
      await createParkingDetails(user, inTime, outTime);
      print(inTime);
    } else {
      _location = getUserLocation(_userX, _userY)
          .map((item) => Location.fromMap(item))
          .toList();
      notifyListeners();
    }
    // if (getPositionY(438, userValidationPositionY) == 0.3 ) {
    //   Fluttertoast.showToast(
    //       msg: "checking out",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
    i++;
  }

  void handleDragScaleEnd() {
    _previousScale = 2.0;
    _endPos = _pos;
    notifyListeners();
  }
}

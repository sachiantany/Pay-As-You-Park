import 'dart:async';

import 'package:custom_zoomable_floorplan/core/models/location_model.dart';
import 'package:custom_zoomable_floorplan/core/models/models.dart';
import 'package:custom_zoomable_floorplan/view/shared/global.dart';
import 'package:custom_zoomable_floorplan/view/shared/global_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:async/async.dart';

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

  void reset() {
    _scale = 2.0;
    _previousScale = 2.0;
    _pos = Pos(0.0, 0.0);
    _previousPos = Pos(0.0, 0.0);
    _endPos = Pos(0.0, 0.0);
    _isScaled = false;
    _userX = userLocationX[0];
    _userY = userLocationY[1];
    _location = getUserLocation(_userX, _userY)
        .map((item) => Location.fromMap(item))
        .toList();
    notifyListeners();
  }

  void handleDragScaleEnd() {
    _previousScale = 2.0;
    _endPos = _pos;
    notifyListeners();
  }
}

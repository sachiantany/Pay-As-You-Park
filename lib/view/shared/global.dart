import 'package:flutter/material.dart';

abstract class Global {
  static const Color blue = const Color(0xff4A64FE);

  static const List lights = [
    {
      'location': 'Kitchen',
      'name': 'LED001',
      'status': false,
      'position': [0.0, 0.0],
      'tile': 1,
    }
  ];
}

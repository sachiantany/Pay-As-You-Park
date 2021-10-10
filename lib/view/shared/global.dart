import 'package:flutter/material.dart';

abstract class Global {
  var parkingCount = 10;
  static const Color blue = const Color(0xff4A64FE);

  static const List slots = [
    //Left Line parking slots

    {
      'location': 'Kitchen',
      'name': 'A01',
      'status': true,
      'position': [-0.125, -0.310],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A02',
      'status': false,
      'position': [-0.125, -0.264],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A03',
      'status': false,
      'position': [-0.125, -0.218],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A04',
      'status': true,
      'position': [-0.125, -0.172],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A05',
      'status': false,
      'position': [-0.125, -0.126],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A06',
      'status': false,
      'position': [-0.125, -0.080],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A07',
      'status': false,
      'position': [-0.125, -0.034],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A08',
      'status': false,
      'position': [-0.125, 0.012],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A09',
      'status': false,
      'position': [-0.125, 0.058],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A10',
      'status': false,
      'position': [-0.125, 0.104],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A11',
      'status': false,
      'position': [-0.125, 0.150],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'A12',
      'status': false,
      'position': [-0.125, 0.196],
      'tile': 1,
    },

    //right hand up parking slots
    {
      'location': 'Kitchen',
      'name': 'B01',
      'status': false,
      'position': [0.09, -0.305],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'B02',
      'status': false,
      'position': [0.09, -0.259],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'B03',
      'status': false,
      'position': [0.09, -0.213],
      'tile': 1,
    },

    //right hand down parking slots
    {
      'location': 'Kitchen',
      'name': 'C01',
      'status': false,
      'position': [0.085, 0.093],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'C02',
      'status': false,
      'position': [0.085, 0.137],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'C03',
      'status': false,
      'position': [0.085, 0.181],
      'tile': 1,
    },
    {
      'location': 'Kitchen',
      'name': 'C04',
      'status': false,
      'position': [0.085, 0.225],
      'tile': 1,
    }
  ];
}

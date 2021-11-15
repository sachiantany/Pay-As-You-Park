import 'package:pay_as_you_park/screens/loginscreen.dart';
import 'package:pay_as_you_park/screens/home.dart';

import 'package:flutter/material.dart';
import 'package:pay_as_you_park/screens/register_driver.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';

class Routes {
  Routes._();

  final DriverStore _userStore = DriverStore();

  //static variables
  static const String login = '/login';
  static const String homepage = '/homepage';
  static const String register = '/register';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    //homepage: (BuildContext context) => HomeScreen(user: _userStore),
    register: (BuildContext context) => DriverRegisterScreen(),
  };
}



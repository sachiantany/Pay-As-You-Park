import 'package:pay_as_you_park/screens/loginscreen.dart';
import 'package:pay_as_you_park/screens/home.dart';

import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String login = '/login';
  static const String homepage = '/homepage';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    homepage: (BuildContext context) => HomeScreen(),
  };
}




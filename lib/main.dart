import 'package:flutter/material.dart';
import 'package:pay_as_you_park/constants/app_theme.dart';
import 'package:pay_as_you_park/screens/home.dart';
import 'package:pay_as_you_park/screens/loginscreen.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';
import 'package:pay_as_you_park/utils/routes/routes.dart';

import 'di/service_locator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final DriverStore _userStore = DriverStore();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: _userStore.success ? HomeScreen(user: _userStore,) : LoginScreen(),
      routes: Routes.routes,
    );
  }
}

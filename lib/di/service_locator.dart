
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';
import 'package:pay_as_you_park/store/error/error_store.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => DriverStore());



  // stores:--------------------------------------------------------------------
  //getIt.registerSingleton(DriverStore(getIt<Repository>()));
}

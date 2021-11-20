import 'dart:math';
import 'package:pay_as_you_park/flter/kalman_filter.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:pay_as_you_park/core/models/getLocationModel.dart';

class AndroidBeaconLibraryModel {
  Dio dio = new Dio();

  getCalculatedDistance(double rssi, int txAt1Meter) {
    print(txAt1Meter);
    var ratio = rssi * (1.0 / (txAt1Meter + 55));
    if (ratio < 1.0) {
      return pow(ratio, 10);
    } else {
      return (1.21112) * pow(ratio, 7.560861) + 0.251;
    }
  }

  Future<GetLocationModel> getIndoorLocationDetails() async {
    String url =
        'https://pay-as-you-park-mobile-server.herokuapp.com/indoor/:id';
    Response response;
    var locationModel;
    int txAt1MeterBeaconA = 55;
    var beaconADistance = getCalculatedDistance(
        KalmanFilter.getFilteredValue(0.25), txAt1MeterBeaconA);

    var beaconBDistance = getCalculatedDistance(
        KalmanFilter.getFilteredValue(0.25), txAt1MeterBeaconA);

    var beaconCDistance = getCalculatedDistance(
        KalmanFilter.getFilteredValue(0.25), txAt1MeterBeaconA);

    try {
      response = await dio.post(url);

      if (response.statusCode == 200) {
        // print(jsonDecode(response.data));
        // var jsonString = response.data;
        locationModel = response.data;
        print(locationModel);
        // locationModel = jsonString;
      }
      print(locationModel);
      print(beaconBDistance);
      print(beaconCDistance);
      print(beaconADistance);
      return locationModel;
    } catch (Exception) {
      return locationModel;
    }
  }

  Future<GetLocationModel> createLocation(
      String user, String distanceX, String distanceY) async {
    var locationModel;
    int txAt1MeterBeaconA = 55;
    var beaconADistance = getCalculatedDistance(
        KalmanFilter.getFilteredValue(0.25), txAt1MeterBeaconA);

    var beaconBDistance = getCalculatedDistance(
        KalmanFilter.getFilteredValue(0.25), txAt1MeterBeaconA);

    var beaconCDistance = getCalculatedDistance(
        KalmanFilter.getFilteredValue(0.25), txAt1MeterBeaconA);

    final String createLocationUrl =
        "https://pay-as-you-park-mobile-server.herokuapp.com/indoor/";

    Response response = await dio.post(createLocationUrl,
        data: {"user": user, "distanceX": distanceX, "distanceY": distanceY});

    if (response.statusCode == 201) {
      final responseStringLocation = response.data;
      // print("Inside 201");
      return getLocationModelFromJson(responseStringLocation);
    } else {
      final errorMsg = null;
      return errorMsg;
    }
  }
}

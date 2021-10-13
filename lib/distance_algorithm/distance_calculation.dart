import 'dart:math';

class AndroidBeaconLibraryModel {
  getCalculatedDistance(double rssi, int txAt1Meter) {
    print(txAt1Meter);
    var ratio = rssi * (1.0 / (txAt1Meter + 55));
    if (ratio < 1.0) {
      return pow(ratio, 10);
    } else {
      return (1.21112) * pow(ratio, 7.560861) + 0.251;
    }
  }
}

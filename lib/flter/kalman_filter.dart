class KalmanFilter {
  KalmanFilter(double processNoise, double sensorNoise, double estimatedError,
      double initialValue) {
    q = processNoise;
    r = sensorNoise;
    p = estimatedError;
    x = initialValue;

    print("Kalman Filter initialised");
  }

  /* Kalman filter variables */
  static const double TRAINING_PREDICTION_LIMIT = 500;
  static late double q; //process noise covariance
  static late double r; //measurement noise covariance
  static late double x; //value
  static late double p; //estimation error covariance
  static late double k; //kalman gain
  static late double predictionCycles = 0;

  static double getFilteredValue(double measurement) {
    // prediction phase
    p = p + q;

    // measurement update
    k = p / (p + r);
    x = x + k * (measurement - x);
    p = (1 - k) * p;

    return x;
  }

  late double beaconA = getFilteredValue(0.57);
  late double beaconB = getFilteredValue(0.87);
  late double beaconC = getFilteredValue(0.27);
}

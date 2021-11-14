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
  late double q; //process noise covariance
  late double r; //measurement noise covariance
  late double x; //value
  late double p; //estimation error covariance
  late double k; //kalman gain
  late double predictionCycles = 0;

  double getFilteredValue(double measurement) {
    // prediction phase
    p = p + q;

    // measurement update
    k = p / (p + r);
    x = x + k * (measurement - x);
    p = (1 - k) * p;

    return x;
  }
}

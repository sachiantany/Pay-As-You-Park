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
  double q; //process noise covariance
  double r; //measurement noise covariance
  double x; //value
  double p; //estimation error covariance
  double k; //kalman gain
  double predictionCycles = 0;

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

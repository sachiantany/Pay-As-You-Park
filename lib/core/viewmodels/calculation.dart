class PositionCalculation {
  double positionX;
  double positionY;
  int actualX;
  int actualY;
  int lengthX;
  int lengthY;
  int convertionConstant = 457;

  double getPositionX(lengthX, actualX) {
    double x;
    x = actualX.toDouble();

    positionX = ((actualX) - (lengthX / 2));
    print(positionX);

    double imagePositionX = positionX / convertionConstant;
    // print(imagePositionX);
    return imagePositionX;
  }

  double getPositionY(lengthY, actualY) {
    double y;
    y = actualY.toDouble();

    positionY = ((actualY) - (lengthY / 2));
    print(positionY);

    double imagePositionY = positionY / convertionConstant;
    // print(imagePositionY);
    return imagePositionY;
  }
}

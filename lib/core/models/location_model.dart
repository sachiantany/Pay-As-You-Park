class Location {
  String nameLocation;
  double positionLocationX;
  double positionLocationY;
  int tileLocation;

  Location.fromMap(Map data) {
    this.nameLocation = data['nameLocation'] ?? 'No name.';
    this.positionLocationX = data['positionLocationX'] ?? [0.0];
    this.positionLocationY = data['positionLocationY'] ?? [0.0];
    this.tileLocation = data['tileLocation'] ?? 0;
  }
}

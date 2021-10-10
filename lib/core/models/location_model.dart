class Location {
  String nameLocation;
  List<double> positionLocation;
  int tileLocation;

  Location.fromMap(Map data) {
    this.nameLocation = data['nameLocation'] ?? 'No name.';
    this.positionLocation = data['positionLocation'] ?? [0.0];
    this.tileLocation = data['tileLocation'] ?? 0;
  }
}

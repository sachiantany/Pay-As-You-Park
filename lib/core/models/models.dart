class Slot {
  late String location;
  late String name;
  late bool status;
  late List<double> position;
  late int tile;

  Slot.fromMap(Map data) {
    this.location = data['location'] ?? 'No location.';
    this.name = data['name'] ?? 'No name.';
    this.status = data['status'] ?? false;
    this.position = data['position'] ?? [0.0];
    this.tile = data['tile'] ?? 0;
  }
}

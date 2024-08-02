class Seat {
  final int row;
  final int number;
  bool isBooked;
  bool isNonSelectable;

  Seat({
    this.isNonSelectable = false,
    required this.row,
    required this.number,
    this.isBooked = false,
  });

  String get rowLabel {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return letters[row % letters.length];
  }
}

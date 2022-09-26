class ResistorColor {
  final Map<String, int> resistors = {
    'black': 0,
    'brown': 1,
    'red': 2,
    'orange': 3,
    'yellow': 4,
    'green': 5,
    'blue': 6,
    'violet': 7,
    'grey': 8,
    'white': 9,
  };

  List<String> get colors => resistors.keys.toList();

  int colorCode(String color) {
    return resistors[color]!;
  }
}

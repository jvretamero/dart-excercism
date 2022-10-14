class ResistorColorDuo {
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

  int colorCode(String color) {
    return resistors[color]!;
  }

  int value(List<String> colors) {
    return int.parse(colors.take(2).map(colorCode).join(""));
  }
}

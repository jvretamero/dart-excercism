class Raindrops {
  String convert(int number) {
    var buffer = StringBuffer();

    if (number % 3 == 0) {
      buffer.write('Pling');
    }

    if (number % 5 == 0) {
      buffer.write('Plang');
    }

    if (number % 7 == 0) {
      buffer.write('Plong');
    }

    if (buffer.isEmpty) {
      buffer.write(number);
    }

    return buffer.toString();
  }
}

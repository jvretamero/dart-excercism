class CollatzConjecture {
  int steps(int number) {
    if (number < 1) throw ArgumentError('Only positive numbers are allowed');

    int steps = 0;
    int result = number;

    while (result > 1) {
      steps++;
      result = _calculate(result);
    }

    return steps;
  }

  int _calculate(int number) =>
      number % 2 == 0 ? number ~/ 2 : (number * 3) + 1;
}

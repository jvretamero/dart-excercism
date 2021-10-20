import 'dart:math';

class DifferenceOfSquares {
  int squareOfSum(int maximum) {
    return pow(_createList(maximum).reduce(_sum), 2).toInt();
  }

  int sumOfSquares(int maximum) {
    return _createList(maximum)
        .map((number) => pow(number, 2).toInt())
        .reduce(_sum);
  }

  int differenceOfSquares(int maximum) {
    int squares = squareOfSum(maximum);
    int sum = sumOfSquares(maximum);
    return squares - sum;
  }

  int _sum(int value, int element) => value + element;

  Iterable<int> _createList(int maximum) =>
      List.generate(maximum, (index) => index + 1);
}

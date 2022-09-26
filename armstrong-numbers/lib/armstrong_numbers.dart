import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) {
    var digits = splitDigits(number);
    return digits.fold<int>(
            0, (sum, digit) => sum + pow(digit, digits.length).toInt()) ==
        number;
  }

  List<int> splitDigits(int number) {
    return number.toString().split('').map((e) => int.parse(e)).toList();
  }
}

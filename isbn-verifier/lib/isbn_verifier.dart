bool isValid(String isbn) {
  var numbers = isbn.replaceAll('-', '').split('').toList();

  if (numbers.length != 10) {
    return false;
  }

  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    int weight = numbers.length - i;
    int number = i == numbers.length - 1 && numbers[i] == 'X'
        ? 10
        : int.tryParse(numbers[i]) ?? 1;
    sum += number * weight;
  }

  return sum % 11 == 0;
}

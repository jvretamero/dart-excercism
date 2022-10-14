String reverse(String input) {
  List<int> reversed = <int>[];

  for (int i = input.length - 1; i >= 0; i--) {
    reversed.add(input.codeUnitAt(i));
  }

  return String.fromCharCodes(reversed);
}

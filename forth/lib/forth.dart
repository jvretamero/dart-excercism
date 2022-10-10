class Forth {
  List<int> get stack => List.unmodifiable(_stack);

  List<int> _stack = <int>[];

  void evaluate(String expression) {
    List<String> tokens = expression.split(' ');

    for (String token in tokens) {
      int number = int.parse(token);
      _stack.add(number);
    }
  }
}

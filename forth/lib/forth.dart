class Forth {
  List<int> get stack => List.unmodifiable(_stack);

  List<int> _stack = <int>[];

  void evaluate(String expression) {
    List<String> tokens = expression.split(' ');

    for (String token in tokens) {
      if (_isOperand(token)) {
        if (token == '+') {
          _add();
        }
      } else {
        int number = int.parse(token);
        _push(number);
      }
    }
  }

  bool _isOperand(String token) => token == '+';

  int _pop() {
    if (_stack.isEmpty) throw Exception('Stack empty');

    return _stack.removeLast();
  }

  void _push(int number) => _stack.add(number);

  void _add() {
    int left = _pop();
    int right = _pop();

    _push(left + right);
  }
}

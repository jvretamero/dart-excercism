class Forth {
  List<int> get stack => List.unmodifiable(_stack);

  List<int> _stack = <int>[];

  void evaluate(String expression) {
    List<String> tokens = expression.split(' ');

    for (String token in tokens) {
      switch (token) {
        case '+':
          _add();
          break;
        case '-':
          _subtract();
          break;
        default:
          _pushNumber(token);
      }
    }
  }

  int _pop() {
    if (_stack.isEmpty) throw Exception('Stack empty');

    return _stack.removeLast();
  }

  void _push(int number) => _stack.add(number);

  void _pushNumber(String token) {
    int number = int.parse(token);
    _push(number);
  }

  void _add() {
    int right = _pop();
    int left = _pop();

    _push(left + right);
  }

  void _subtract() {
    int right = _pop();
    int left = _pop();

    _push(left - right);
  }
}

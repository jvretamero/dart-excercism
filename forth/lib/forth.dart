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
        case '*':
          _multiply();
          break;
        case '/':
          _divide();
          break;
        case 'dup':
          _duplicate();
          break;
        case 'drop':
          _pop();
          break;
        default:
          _pushNumber(token);
      }
    }
  }

  void _checkEmptyStack() {
    if (_stack.isEmpty) {
      throw Exception('Stack empty');
    }
  }

  int _pop() {
    _checkEmptyStack();
    return _stack.removeLast();
  }

  int _peek() {
    _checkEmptyStack();
    return _stack.last;
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

  void _multiply() {
    int right = _pop();
    int left = _pop();

    _push(left * right);
  }

  void _divide() {
    int right = _pop();
    int left = _pop();

    try {
      _push(left ~/ right);
    } on UnsupportedError {
      throw Exception('Division by zero');
    }
  }

  void _duplicate() {
    int top = _peek();
    _push(top);
  }
}

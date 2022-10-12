import 'defined_word.dart';
import 'parser.dart';

class Forth {
  List<int> get stack => List.unmodifiable(_stack);

  List<int> _stack = <int>[];
  Map<String, DefinedWord> _words = {};

  void evaluate(String expression) {
    Parser parser = Parser(expression);

    while (parser.hasTokens) {
      String token = parser.nextToken();

      _evaluateToken(parser, token);
    }
  }

  void _evaluateToken(Parser parser, String token) {
    if (_isDefinedWord(token)) {
      _evaluateWord(parser, token);
      return;
    }

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
      case 'swap':
        _swap();
        break;
      case 'over':
        _over();
        break;
      case ':':
        _wordDefinition(parser);
        break;
      default:
        if (!_isNumber(token)) {
          throw Exception('Unknown command');
        }

        _pushNumber(token);
    }
  }

  void _evaluateDefinedWord(Parser parser, DefinedWord word) {
    if (word.hasTokens) {
      for (DefinedWord wordToken in word.tokens) {
        _evaluateDefinedWord(parser, wordToken);
      }
    } else {
      _evaluateToken(parser, word.name);
    }
  }

  void _evaluateWord(Parser parser, String token) {
    DefinedWord definedWord = _words[token]!;
    _evaluateDefinedWord(parser, definedWord);
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

  void _swap() {
    int first = _pop();
    int second = _pop();

    _push(first);
    _push(second);
  }

  void _over() {
    int top = _pop();
    int over = _peek();

    _push(top);
    _push(over);
  }

  bool _isDefinedWord(String token) => _words.containsKey(token);

  void _wordDefinition(Parser parser) {
    String word = parser.nextToken();

    if (_isNumber(word)) {
      throw Exception('Invalid definition');
    }

    List<DefinedWord> tokens = _getWordTokens(parser);

    DefinedWord definedWord = DefinedWord(word, tokens);
    _words[word] = definedWord;
  }

  bool _isNumber(String token) => int.tryParse(token) != null;

  List<DefinedWord> _getWordTokens(Parser parser) {
    List<DefinedWord> tokens = <DefinedWord>[];

    while (parser.peekToken() != ';') {
      String token = parser.nextToken();

      if (_isDefinedWord(token)) {
        // Store the tokens defined by the word because they can be
        // overrided later
        DefinedWord word = _words[token]!;
        tokens.add(DefinedWord(token, word.tokens));
      } else {
        tokens.add(DefinedWord.token(token));
      }
    }

    // Consume the ";" token
    parser.nextToken();

    return tokens;
  }
}

class Parser {
  late List<String> _tokens;

  Parser(String expression) {
    _tokens = expression.toLowerCase().split(' ');
  }

  bool get hasTokens => _tokens.length > 0;

  String nextToken() => _tokens.removeAt(0);

  String peekToken() => _tokens.elementAt(0);
}

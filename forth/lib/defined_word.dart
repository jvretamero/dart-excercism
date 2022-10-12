class DefinedWord {
  final String name;
  final List<DefinedWord> tokens;
  bool get hasTokens => tokens.length > 0;

  DefinedWord(this.name, this.tokens);

  factory DefinedWord.token(String name) {
    return DefinedWord(name, <DefinedWord>[]);
  }
}

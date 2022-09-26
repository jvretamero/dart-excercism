class WordCount {
  Map<String, int> countWords(String phrase) {
    var words = _splitWords(phrase);
    Map<String, int> map = {};

    for (var word in words) {
      if (map.containsKey(word)) {
        int count = map[word]!;
        map[word] = count + 1;
      } else {
        map[word] = 1;
      }
    }

    return map;
  }

  Iterable<String> _splitWords(String phrase) sync* {
    var buffer = StringBuffer();
    List<int> codeUnits = phrase.codeUnits;
    int? lastChar;

    for (int i = 0; i < codeUnits.length; i++) {
      int char = codeUnits[i];

      if (_isDigit(char) || _isLetter(char)) {
        if (_isApostrophe(char) &&
            (!_isLetter(lastChar ?? 0) || i == codeUnits.length - 1)) {
          continue;
        }

        buffer.write(String.fromCharCode(char));
      } else if (buffer.isNotEmpty) {
        yield buffer.toString().toLowerCase();
        buffer.clear();
      }

      lastChar = char;
    }

    if (buffer.isNotEmpty) yield buffer.toString().toLowerCase();
  }

  bool _isDigit(int char) {
    return char >= 48 && char <= 57;
  }

  bool _isLetter(int char) {
    return (char >= 65 && char <= 90) ||
        (char >= 97 && char <= 122) ||
        _isApostrophe(char);
  }

  bool _isApostrophe(int char) {
    return char == 39;
  }
}

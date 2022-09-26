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
    StringBuffer buffer = StringBuffer();

    for (var char in phrase.codeUnits) {
      if (_isDigit(char) || _isLetter(char)) {
        buffer.write(String.fromCharCode(char));
      } else if (_isWhitespace(char)) {
        yield buffer.toString();
        buffer.clear();
      }
    }

    if (buffer.isNotEmpty) yield buffer.toString();
  }

  bool _isDigit(int char) {
    return char >= 48 && char <= 57;
  }

  bool _isLetter(int char) {
    return (char >= 65 && char <= 90) ||
        (char >= 97 && char <= 122) ||
        char == 39;
  }

  bool _isWhitespace(int char) {
    return char == 9 || char == 10 || char == 32;
  }
}

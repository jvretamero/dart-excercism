class Bob {
  String response(String phrase) {
    var trimmedPhrase = phrase.trim();
    bool isCapitalized = trimmedPhrase == trimmedPhrase.toUpperCase() &&
        RegExp(r'[a-zA-Z]').hasMatch(trimmedPhrase);
    bool isQuestion = trimmedPhrase.endsWith('?');

    if (trimmedPhrase.trim().isEmpty)
      return 'Fine. Be that way!';
    else if (isQuestion) {
      if (isCapitalized)
        return 'Calm down, I know what I\'m doing!';
      else
        return 'Sure.';
    } else if (isCapitalized) {
      return 'Whoa, chill out!';
    }

    return 'Whatever.';
  }
}

class WordCount {
  // After reading some solutions, I found that I could use a simple regular expression
  // to match letters and digits (\w), the apostrophe, and ignore the rest
  Map<String, int> countWords(String phrase) {
    var normalizedPrhase = phrase.toLowerCase();
    var words = Map<String, int>();
    Iterable<RegExpMatch> matches =
        new RegExp(r"\w+('\w+)*").allMatches(normalizedPrhase);

    for (var match in matches) {
      var word = normalizedPrhase.substring(match.start, match.end);
      if (words.containsKey(word)) {
        var count = words[word]!;
        words[word] = count + 1;
      } else {
        words[word] = 1;
      }
    }

    return words;
  }
}

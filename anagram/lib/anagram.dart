class Anagram {
  List<String> findAnagrams(String word, List<String> candidates) {
    String loweredWord = word.toLowerCase();
    String orderedWord = _orderLetters(loweredWord);

    return candidates.where((w) {
      String lw = w.toLowerCase();
      return lw != loweredWord && _orderLetters(lw) == orderedWord;
    }).toList();
  }

  String _orderLetters(String word) {
    var sorted = word.split('')..sort();

    return sorted.join();
  }
}

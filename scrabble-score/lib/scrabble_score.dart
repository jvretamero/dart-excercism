int score(String phrase) {
  Map<String, int> scores = {
    'aeioulnrst': 1,
    'dg': 2,
    'bcmp': 3,
    'fhvwy': 4,
    'k': 5,
    'jx': 8,
    'qz': 10,
  };

  var lowerPhrase = phrase.toLowerCase().split('');
  var score = 0;

  for (var letter in lowerPhrase) {
    for (var key in scores.keys) {
      if (key.contains(letter)) {
        score += scores[key]!;
      }
    }
  }
  return score;
}

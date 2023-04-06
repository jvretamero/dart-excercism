class HighScores {
  final List<int> scores;

  HighScores(this.scores);

  int latest() => scores.last;

  int personalBest() =>
      scores.reduce((value, element) => element > value ? element : value);

  List<int> personalTopThree() {
    List<int> topScores = [];

    for (int score in scores) {
      if (topScores.length < 3)
        topScores.add(score);
      else
        for (int i = 0; i < topScores.length; i++) {
          if (score > topScores[i]) {
            topScores[i] = score;
            break;
          }
        }
    }

    topScores.sort((a, b) => b.compareTo(a));

    return topScores;
  }
}

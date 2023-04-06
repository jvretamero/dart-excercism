class HighScores {
  late List<int> scores;
  late List<int> _sortedScores;

  HighScores(List<int> scores) {
    this.scores = scores;

    _sortedScores = List.from(scores);
    _sortedScores.sort();
  }

  int latest() => scores.last;

  int personalBest() => _sortedScores.last;

  List<int> personalTopThree() => _sortedScores.reversed.take(3).toList();
}

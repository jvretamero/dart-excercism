class SumOfMultiples {
  int sum(List<int> factors, int limit) {
    var multiples = factors
        .where((factor) => factor > 0)
        .expand<int>((factor) => _multiples(factor, limit));

    var uniqueMultiples = multiples.toSet();

    var multiplesSum =
        uniqueMultiples.fold<int>(0, (value, element) => value + element);

    return multiplesSum;
  }

  Iterable<int> _multiples(int factor, int limit) sync* {
    int multiplier = 0;
    int multiple = 0;

    do {
      multiplier++;
      multiple = factor * multiplier;

      if (multiple < limit) yield multiple;
    } while (multiple < limit);
  }
}

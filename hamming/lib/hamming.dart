class Hamming {
  int distance(String strandA, String strandB) {
    bool sameSize = strandA.length == strandB.length;
    bool oneIsEmpty = strandA.isEmpty || strandB.isEmpty;

    if (oneIsEmpty && !sameSize) {
      throw ArgumentError('no strand must be empty');
    }

    if (!sameSize) {
      throw ArgumentError('left and right strands must be of equal length');
    }

    int differences = 0;

    for (int i = 0; i < strandA.length; i++) {
      if (strandA[i] != strandB[i]) {
        differences++;
      }
    }

    return differences;
  }
}

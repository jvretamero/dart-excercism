class PascalsTriangle {
  List<List<int>> rows(int row) {
    return List.generate(row, (index) => _buildRow(index));
  }

  List<int> _buildRow(int row) {
    return List.generate(row + 1, (col) => _computeNumber(row, col));
  }

  int _computeNumber(int row, int col) {
    var n = _factorial(row);
    var k = _factorial(col);
    var nk = _factorial(row - col);
    return n ~/ (k * nk);
  }

  int _factorial(int num) {
    return num == 0
        ? 1
        : List.generate(num, (index) => index + 1)
            .reduce((value, element) => value * element);
  }
}

class SecretHandshake {
  Map<int, String> _actions = {
    10000: "reverse",
    1000: "jump",
    100: "close your eyes",
    10: "double blink",
    1: "wink",
  };

  List<String> commands(int number) {
    List<String> actions = <String>[];

    int binary = _toBinary(number);
    bool reverse = false;

    while (binary > 0) {
      for (int bin in _actions.keys) {
        if (binary >= bin) {
          binary -= bin;

          if (bin == 10000) {
            reverse = true;
            continue;
          }

          actions.add(_binaryToAction(bin));
        }
      }
    }

    return reverse ? actions : actions.reversed.toList();
  }

  int _toBinary(int number) {
    return int.parse(number.toRadixString(2));
  }

  String _binaryToAction(int binary) {
    if (_actions.containsKey(binary)) {
      return _actions[binary]!;
    }

    throw Exception("Unknown");
  }
}

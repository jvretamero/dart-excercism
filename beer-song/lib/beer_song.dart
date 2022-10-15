class BeerSong {
  List<String> recite(int numOfBottles, int times) {
    List<String> result = <String>[];

    for (int time = 0; time < times; time++) {
      if (time > 0) result.add("");
      result.addAll(_reciteOne(numOfBottles - time));
    }

    return result;
  }

  List<String> _reciteOne(int numOfBottles) {
    int remainingBottles = numOfBottles - 1;

    return [
      "${_pluralizeBottle(numOfBottles)} of beer on the wall, ${_pluralizeBottle(numOfBottles).toLowerCase()} of beer.",
      _reciteLastVerse(remainingBottles),
    ];
  }

  String _reciteLastVerse(int remainingBottles) {
    if (remainingBottles < 0)
      return "Go to the store and buy some more, 99 bottles of beer on the wall.";
    else
      return "Take ${_pluralizeIt(remainingBottles)} down and pass it around, ${_pluralizeBottle(remainingBottles).toLowerCase()} of beer on the wall.";
  }

  String _pluralizeBottle(int numOfBottles) {
    if (numOfBottles > 1)
      return "$numOfBottles bottles";
    else if (numOfBottles == 1)
      return "$numOfBottles bottle";
    else
      return "No more bottles";
  }

  String _pluralizeIt(int numOfBottles) {
    if (numOfBottles > 0)
      return "one";
    else
      return "it";
  }
}

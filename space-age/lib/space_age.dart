class SpaceAge {
  static const YEAR_IN_SECONDS = 31557600;

  Map<String, double> planets = {
    'Earth': 1,
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132,
  };

  double age({
    required String planet,
    required int seconds,
  }) {
    double earthYears = seconds / YEAR_IN_SECONDS;
    double years = earthYears / planets[planet]!;

    return double.parse(years.toStringAsFixed(2));
  }
}

import 'package:resistor_color_duo/resistor_color_duo.dart';
import 'package:test/test.dart';

final resistorColorDuo = ResistorColorDuo();

void main() {
  group('ResistorColorDuo', () {
    test('Brown and black', () {
      final int result = resistorColorDuo.value(<String>['brown', 'black']);
      expect(result, equals(10));
    });

    test('Blue and grey', () {
      final int result = resistorColorDuo.value(<String>['blue', 'grey']);
      expect(result, equals(68));
    });

    test('Yellow and violet', () {
      final int result = resistorColorDuo.value(<String>['yellow', 'violet']);
      expect(result, equals(47));
    });

    test('Orange and orange', () {
      final int result = resistorColorDuo.value(<String>['orange', 'orange']);
      expect(result, equals(33));
    });

    test('Ignore additional colors', () {
      final int result = resistorColorDuo.value(<String>['green', 'brown', 'orange']);
      expect(result, equals(51));
    });
  });
}

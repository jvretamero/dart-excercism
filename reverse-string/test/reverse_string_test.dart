import 'package:reverse_string/reverse_string.dart';
import 'package:test/test.dart';

void main() {
  group('ReverseString', () {
    test('an empty string', () {
      final String result = reverse('');
      expect(result, equals(''));
    });

    test('a word', () {
      final String result = reverse('robot');
      expect(result, equals('tobor'));
    });

    test('a capitalized word', () {
      final String result = reverse('Ramen');
      expect(result, equals('nemaR'));
    });

    test('a sentence with punctuation', () {
      final String result = reverse('I\'m hungry!');
      expect(result, equals('!yrgnuh m\'I'));
    });

    test('a palindrome', () {
      final String result = reverse('racecar');
      expect(result, equals('racecar'));
    });

    test('an even-sized word', () {
      final String result = reverse('drawer');
      expect(result, equals('reward'));
    });
  });
}

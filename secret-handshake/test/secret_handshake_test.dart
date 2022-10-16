import 'package:secret_handshake/secret_handshake.dart';
import 'package:test/test.dart';

void main() {
  final secretHandshake = new SecretHandshake();

  group('SecretHandshake', () {
    group('Create a handshake for a number', () {
      test('wink for 1', () {
        final List<String> result = secretHandshake.commands(1);
        expect(result, equals(['wink']));
      });

      test('double blink for 10', () {
        final List<String> result = secretHandshake.commands(2);
        expect(result, equals(['double blink']));
      });

      test('close your eyes for 100', () {
        final List<String> result = secretHandshake.commands(4);
        expect(result, equals(['close your eyes']));
      });

      test('jump for 1000', () {
        final List<String> result = secretHandshake.commands(8);
        expect(result, equals(['jump']));
      });

      test('combine two actions', () {
        final List<String> result = secretHandshake.commands(3);
        expect(result, equals(['wink', 'double blink']));
      });

      test('reverse two actions', () {
        final List<String> result = secretHandshake.commands(19);
        expect(result, equals(['double blink', 'wink']));
      });

      test('reversing one action gives the same action', () {
        final List<String> result = secretHandshake.commands(24);
        expect(result, equals(['jump']));
      });

      test('reversing no actions still gives no actions', () {
        final List<String> result = secretHandshake.commands(16);
        expect(result, equals(<String>[]));
      });

      test('all possible actions', () {
        final List<String> result = secretHandshake.commands(15);
        expect(result, equals(['wink', 'double blink', 'close your eyes', 'jump']));
      });

      test('reverse all possible actions', () {
        final List<String> result = secretHandshake.commands(31);
        expect(result, equals(['jump', 'close your eyes', 'double blink', 'wink']));
      });

      test('do nothing for zero', () {
        final List<String> result = secretHandshake.commands(0);
        expect(result, equals(<String>[]));
      });
    });
  });
}

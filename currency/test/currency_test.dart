import 'package:currency/currency.dart';
import 'package:test/test.dart';

void main() {
  group('Currency Constructors', () {
    test('Should create a currency equal to zero', () {
      final money = Currency();

      expect(money.scaledValue, 0);
    });
    test('Should create a currency from a scaled value', () {
      const value = 12345;
      final money = Currency.fromScaledValue(value);

      expect(money.scaledValue, value);
    });
  });
  group('Currency Methods', () {
    test('should convert to double', () {
      final money = Currency();

      expect(money.scaledValue, 0);
    });
    test('', () {});
  });
}

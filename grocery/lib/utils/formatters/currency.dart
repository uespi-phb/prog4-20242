import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static String format(
    double value, [
    decimalDigits = 2,
  ]) {
    final formatter = NumberFormat.simpleCurrency(
      locale: 'pt_br',
      decimalDigits: decimalDigits,
    );
    return formatter.format(value);
  }
}

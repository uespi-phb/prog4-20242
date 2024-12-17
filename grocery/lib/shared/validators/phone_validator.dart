import 'validator.dart';

class PhoneValidator extends Validator {
  PhoneValidator(
    super.fieldName, [
    super.message = 'telefone inválido',
  ]);

  @override
  String? validate(String? value) {
    if (value != null) {
      final cleanedValue = value.replaceAll(RegExp(r'\D'), '');
      if (cleanedValue.length != 10 || cleanedValue.length != 11) {
        return formattedMessage;
      }
    }
    return null;
  }
}

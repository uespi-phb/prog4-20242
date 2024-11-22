import './validator.dart';

class MinLengthValidator extends Validator {
  final int minLength;

  MinLengthValidator(
    super.fieldName,
    this.minLength, [
    super.message = 'deve possuir no mínimo %min caracteres',
  ]);

  @override
  String get formattedMessage {
    final errorMessage = message.replaceAll('%min', minLength.toString());
    return '$fieldName: $errorMessage';
  }

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.length < minLength) {
        return formattedMessage;
      }
    }
    return null;
  }
}

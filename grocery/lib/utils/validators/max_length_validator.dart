import './validator.dart';

class MaxLengthValidator extends Validator {
  final int maxLength;

  MaxLengthValidator(
    super.fieldName,
    this.maxLength, [
    super.message = 'deve possuir no máximo %max caracteres',
  ]);

  @override
  String get formattedMessage =>
      message.replaceAll('%max', maxLength.toString());

  @override
  String? validate(String? value) {
    if (value != null) {
      if (value.length > maxLength) {
        return formattedMessage;
      }
    }
    return null;
  }
}

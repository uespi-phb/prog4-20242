abstract class Validator {
  final String fieldName;
  final String message;

  Validator(this.fieldName, this.message);

  String? validate(String? value);

  String get formattedMessage => '$fieldName: $message';
}

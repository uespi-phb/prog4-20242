import 'validator.dart';

class CompositeValidator extends Validator {
  final List<Validator> validators;

  CompositeValidator(
    super.fieldName,
    this.validators, [
    super.message = '',
  ]);

  @override
  String? validate(String? value) {
    if (value != null) {
      for (final validator in validators) {
        final error = validator.validate(value);
        if (error != null) {
          return error;
        }
      }
    }
    return null;
  }
}

import 'package:grocery/utils/validators/validator.dart';

class EmailValidator extends Validator {
  static const _emailRegExp =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  EmailValidator(
    super.fieldName, [
    super.message = 'e-mail inválido',
  ]);

  @override
  String? validate(String? value) {
    if (value != null) {
      if (!RegExp(_emailRegExp).hasMatch(value)) {
        return formattedMessage;
      }
    }
    return null;
  }
}

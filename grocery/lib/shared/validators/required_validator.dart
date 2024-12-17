import 'package:grocery/shared/validators/validator.dart';

class RequiredValidator extends Validator {
  RequiredValidator(
    super.fieldName, [
    super.message = 'campo obrgatório',
  ]);

  @override
  String? validate(String? value) {
    if ((value != null) && value.isEmpty) {
      return formattedMessage;
    }
    return null;
  }
}

import 'package:grocery/utils/validators/validator.dart';

class RequiredValidator implements Validator {
  @override
  String get errorMessage => 'Campo obrigatório';

  @override
  String? validator(String? value) {
    if (value != null) {
      return value.isEmpty ? errorMessage : null;
    }
    return null;
  }
}

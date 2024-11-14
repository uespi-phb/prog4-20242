import './validator.dart';

class PhoneValidator implements Validator {
  @override
  String get errorMessage => 'Telefone Inválido';

  @override
  String? validator(String? value) {
    if (value != null) {
      value = value.replaceAll(RegExp(r'[^\d]'), '');
      if (value != 10 && value != 11) {
        return 'Telefone inválido';
      }
    }
    return null;
  }
}

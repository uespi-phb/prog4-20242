import 'validator.dart';

class CpfValidator extends Validator {
  CpfValidator(
    super.fieldName, [
    super.message = 'inválido',
  ]);

  @override
  String? validate(String? value) {
    if (value != null) {
      if (!_validateCpf(value)) {
        return formattedMessage;
      }
    }
    return null;
  }

  bool _validateCpf(String cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'\D'), '');

    // Verifica o comprimento do CPF
    if (cpf.length != 11) return false;

    // Verifica se todos os dígitos são iguais
    if (_allDigitsTheSame(cpf)) return false;

    // Calcula os dígitos verificadores
    final int digit1 = _calculateDigit(cpf, 10);
    final int digit2 = _calculateDigit(cpf, 11);

    // Compara os dígitos calculados com os extraídos
    return '$digit1$digit2' == _extractDigit(cpf);
  }

  bool _allDigitsTheSame(String cpf) {
    final String firstDigit = cpf[0];
    return cpf.split('').every((digit) => digit == firstDigit);
  }

  int _calculateDigit(String cpf, int factor) {
    int total = 0;

    // Itera sobre os dígitos e calcula o total ponderado
    for (int i = 0; i < cpf.length; i++) {
      if (factor > 1) {
        total += int.parse(cpf[i]) * factor;
        factor--;
      }
    }

    // Calcula o dígito com base no resto
    final int remainder = total % 11;
    return (remainder < 2) ? 0 : 11 - remainder;
  }

  String _extractDigit(String cpf) {
    return cpf.substring(9); // Obtém os dois últimos dígitos
  }
}

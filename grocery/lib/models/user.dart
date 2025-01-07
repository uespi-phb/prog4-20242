import 'package:grocery/models/user_credentials.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String cpf;
  final UserCredentials credentials;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.credentials,
  });
}

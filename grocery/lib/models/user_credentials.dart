import 'dart:convert';

class UserCredentials {
  final String token;
  final String refreshToken;
  final DateTime expiresIn;

  UserCredentials({
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory UserCredentials.fromJson(String json) {
    final data = jsonDecode(json);
    return UserCredentials(
      token: data['idToken'],
      refreshToken: data['refreshToken'],
      expiresIn: DateTime.now().add(Duration(seconds: data['expiresIn'])),
    );
  }
}

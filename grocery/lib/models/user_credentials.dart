import 'dart:convert';

class UserCredentials {
  final String token;
  final String refreshToken;
  final int expiresIn;

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
      expiresIn: int.parse(data['expiresIn']),
    );
  }
}

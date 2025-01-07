import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_credentials.dart';

typedef HttpMap = Map<String, String>;

class AuthService {
  final apiKey = 'AIzaSyAgKjUhvy-FegBLUiey5ZgQdUZlr2RsG_E';
  final apiUrl = 'https://identitytoolkit.googleapis.com/v1/accounts';
  final apiHeaders = <String, String>{
    'Content-Type': 'application/json',
  };

  Future<UserCredentials?> signIn(String email, String password) async {
    final url = Uri.parse('$apiUrl:signInWithPassword?key=$apiKey');

    final body = jsonEncode({
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });

    final response = await http.post(
      url,
      headers: apiHeaders,
      body: body,
    );

    if (response.statusCode != 200) {
      return null;
    }

    return UserCredentials.fromJson(response.body);
  }

  Future<void> signUp(String email, String password) async {
    // final url = '$apiUrl:signUp';

    // final response = await http.post<HttpMap>(
    //   url,
    //   queryParameters: apiQueryParams,
    //   options: apiHeaders,
    //   data: {
    //     'email': email,
    //     'password': password,
    //     'returnSecureToken': true,
    //   },
    // );

    // debugPrint(response.toString());
  }

  Future<void> signOut() async {
    //TODO: Implment signOut
  }
}

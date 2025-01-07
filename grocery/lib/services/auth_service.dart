import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../models/user_credentials.dart';

typedef HttpMap = Map<String, String>;

class AuthService {
  final apiKey = 'AIzaSyAgKjUhvy-FegBLUiey5ZgQdUZlr2RsG_E';
  final apiAuthUrl = 'https://identitytoolkit.googleapis.com/v1/accounts';
  final apiUrl = 'https://grocery-34649-default-rtdb.firebaseio.com';
  final apiHeaders = <String, String>{
    'Content-Type': 'application/json',
  };

  Future<User?> signIn(String email, String password) async {
    final url = Uri.parse('$apiAuthUrl:signInWithPassword?key=$apiKey');

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

    //TODO: obter os dados do usuário

    throw Exception();
  }

  Future<User?> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String cpf,
  }) async {
    final credentials = await _firebaseSignUp(email, password);
    if (credentials == null) {
      return null;
    }
    final userData = {
      'id': credentials['localId'],
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'cpf': cpf,
      'credentials': credentials,
    };
    return await _restSignUp(userData);
  }

  Future<Map<String, dynamic>?> _firebaseSignUp(
      String email, String password) async {
    final url = Uri.parse('$apiAuthUrl:signUp?key=$apiKey');

    final body = jsonEncode({
      'email': email,
      'password': password,
      'returnSecureToken': false,
    });

    final response = await http.post(
      url,
      headers: apiHeaders,
      body: body,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = jsonDecode(response.body);
    return {
      'localId': data['localId'],
      'token': data['idToken'],
      'refreshToken': data['refreshToken'],
      'expiresIn': int.parse(data['expiresIn']),
    };
  }

  Future<User?> _restSignUp(Map<String, dynamic> data) async {
    final id = data['id'] as String;
    final url = Uri.parse('$apiUrl/users/$id.json');

    final response = await http.put(
      url,
      headers: apiHeaders,
      body: jsonEncode({
        'email': data['email'],
        'name': data['name'],
        'phone': data['phone'],
        'cpf': data['cpf'],
      }),
    );

    if (response.statusCode != 200) {
      return null;
    }

    return User(
      id: id,
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      cpf: data['cpf'],
      credentials: UserCredentials(
        token: data['token'],
        refreshToken: data['refreshToken'],
        expiresIn: data['expiresIn'],
      ),
    );
  }
}

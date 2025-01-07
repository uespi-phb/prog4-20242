import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/models/user_credentials.dart';

import '../models/user.dart';

class UserProvider extends Notifier<User?> {
  User? _user;

  @override
  User? build() => null;

  User? get user => _user;

  void load(UserCredentials credentials) {}
}

final userProvider = NotifierProvider<UserProvider, User?>(UserProvider.new);

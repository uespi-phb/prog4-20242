import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

class UserProvider extends Notifier<User?> {
  @override
  User? build() => null;
}

final userProvider = NotifierProvider<UserProvider, User?>(UserProvider.new);

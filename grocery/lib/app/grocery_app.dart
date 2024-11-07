import 'package:flutter/material.dart';
import 'package:grocery/app/app_theme.dart';

import '../auth/auth_page.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligth(Colors.green),
      home: const AuthPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grocery/app/app_theme.dart';

import './app_routes.dart';
import '../auth/sign_in_page.dart';
import '../auth/sign_up_page.dart';
import '../main/main_page.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligth(Colors.green),
      initialRoute: AppRoutes.main,
      routes: {
        AppRoutes.main: (_) => const MainPage(),
        AppRoutes.signIn: (_) => SignInPage(),
        AppRoutes.signUp: (_) => SignUpPage(),
      },
    );
  }
}

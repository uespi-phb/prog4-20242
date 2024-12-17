import 'package:flutter/material.dart';
import 'package:grocery/app/app_theme.dart';

import '../models/product.dart';
import './app_routes.dart';
import '../pages/product/product_detail_page.dart';
import '../pages/auth/sign_in_page.dart';
import '../pages/auth/sign_up_page.dart';
import '../pages/main/main_page.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    Widget Function(BuildContext) pageBuilder;

    switch (settings.name) {
      case AppRoutes.signIn:
        pageBuilder = (_) => SignInPage();
        break;
      case AppRoutes.signUp:
        pageBuilder = (_) => SignUpPage();
        break;
      case AppRoutes.productDetail:
        pageBuilder =
            (_) => ProductDetailPage(product: settings.arguments as Product);
        break;
      default:
        pageBuilder = (_) => const MainPage();
        break;
    }

    return MaterialPageRoute(builder: pageBuilder);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligth(Colors.green),
      initialRoute: AppRoutes.main,
      onGenerateRoute: _generateRoute,
    );
  }
}

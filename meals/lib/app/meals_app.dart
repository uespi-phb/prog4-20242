import 'package:flutter/material.dart';
import 'package:meals/widgets/favorites_widget.dart';

import './routes.dart';
import '../models/category.dart';
import '../pages/category_meals_page.dart';
import '../pages/main_page.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
        brightness: Brightness.light,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 24.0,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: const MainPage(),
      initialRoute: '/',
      routes: {
        Routes.root: (_) => const MainPage(),
        Routes.favorites: (_) => const FavoritesWidget(),
        Routes.categoryMeals: (context) {
          final category =
              ModalRoute.of(context)?.settings.arguments as Category;
          return CategoryMealsPage(category);
        },
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/pages/meal_detail_page.dart';
import 'package:meals/widgets/favorites_widget.dart';

import '../models/meal.dart';
import './routes.dart';
import '../models/category.dart';
import '../pages/category_meals_page.dart';
import '../pages/main_page.dart';

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
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
        //Routes.root: (_) => const MainPage(),
        Routes.root: (_) => MealDetailPage(kMeals[0]),
        Routes.favorites: (_) => const FavoritesWidget(),
        Routes.categoryMeals: (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;
          debugPrint('category: $argument');
          return CategoryMealsPage(argument as Category);
        },
        Routes.mealDetail: (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;
          debugPrint('meal: $argument');
          return MealDetailPage(argument as Meal);
        }
      },
    );
  }
}

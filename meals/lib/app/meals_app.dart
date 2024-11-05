import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/meal_detail_page.dart';
import '../pages/settings_page.dart';
import '../widgets/favorites_widget.dart';
import '../models/meal.dart';
import '../pages/main_page.dart';
import '../providers/meals_provider.dart';
import '../models/category.dart';
import '../pages/category_meals_page.dart';
import './routes.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MealsProvider>(
      create: (_) => MealsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
          brightness: Brightness.light,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.pink, // Cor de fundo
            selectedItemColor: Colors.white, // Cor dos itens selecionados
            unselectedItemColor:
                Colors.pink.shade200, // Cor dos itens não selecionados
          ),
        ),
        initialRoute: '/',
        routes: {
          Routes.root: (_) => const MainPage(),
          Routes.favorites: (_) => const FavoritesWidget(),
          Routes.settings: (_) => const SettingsPage(),
          Routes.categoryMeals: (context) {
            final argument = ModalRoute.of(context)?.settings.arguments;
            final category = argument as Category;

            return CategoryMealsPage(category);
          },
          Routes.mealDetail: (context) {
            final argument = ModalRoute.of(context)?.settings.arguments;
            return MealDetailPage(argument as Meal);
          }
        },
      ),
    );
  }
}

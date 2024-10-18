import 'package:flutter/material.dart';
import 'package:meals/models/meal_filter.dart';

import '../models/category.dart';
import '../models/meal.dart';
import './meals.dart';
import './categories.dart';

class MealsProvider with ChangeNotifier {
  final List<Category> categories = dataCategories;
  final List<Meal> meals = dataMeals;
  final Map<MealFilter, bool> filters = {};

  MealsProvider() {
    for (var key in MealFilter.values) {
      filters[key] = true;
    }
  }

  bool get filterGlutenFree => filters[MealFilter.glutenFree] ?? false;
  bool get filterLactoseFree => filters[MealFilter.lactoseFree] ?? false;
  bool get filterVegan => filters[MealFilter.vegan] ?? false;
  bool get filterVegetarian => filters[MealFilter.vegetarian] ?? false;

  bool mealObeyFilters(Meal meal) {
    return filterGlutenFree && meal.isGlutenFree ||
        filterLactoseFree && meal.isLactoseFree ||
        filterVegan && meal.isVegan ||
        filterVegetarian && meal.isVegetarian;
  }

  Iterable<Meal> mealsByCategory(Category category) {
    return meals.where((meal) =>
        meal.categories.contains(category.id) && mealObeyFilters(meal));
  }

  Iterable<Meal> mealsFavorite() {
    return meals.where((meal) => meal.isFavorite);
  }

  void toggleFavorite(Meal meal) {
    meal.isFavorite = !meal.isFavorite;
    notifyListeners();
  }

  void setFilter(MealFilter filter, bool value) {
    filters[filter] = value;
    notifyListeners();
  }
}

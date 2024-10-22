import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meals/models/meal_filter.dart';

import '../models/category.dart';
import '../models/meal.dart';
import './meals.dart';
import './categories.dart';

class MealsProvider with ChangeNotifier {
  final apiUrl = 'https://meals-20242-default-rtdb.firebaseio.com';

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

  void exportMeals() {
    final url = '$apiUrl/meals.json';

    for (var meal in meals) {
      final json = jsonEncode(meal.toMap());
      post(
        Uri.parse(url),
        body: json,
      );
    }
  }

  void exportCategories() {
    final url = '$apiUrl/categories.json';

    for (var category in categories) {
      final json = jsonEncode(category.toMap());
      post(
        Uri.parse(url),
        body: json,
      );
    }
  }
}

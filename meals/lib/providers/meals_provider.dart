import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:meals/models/meal_filter.dart';

import '../models/category.dart';
import '../models/meal.dart';

class MealsProvider with ChangeNotifier {
  final apiUrl = 'https://meals-20242-default-rtdb.firebaseio.com';

  final List<Category> categories = [];
  final List<Meal> meals = [];
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
    return meals.where(
        (meal) => meal.categories.contains(category) && mealObeyFilters(meal));
  }

  Iterable<Meal> mealsFavorite() {
    return meals.where((meal) => meal.isFavorite);
  }

  void toggleFavorite(Meal meal) {
    meal.isFavorite = !meal.isFavorite;
    _saveFavorite(meal);
    notifyListeners();
  }

  void setFilter(MealFilter filter, bool value) {
    filters[filter] = value;
    notifyListeners();
  }

  Future<void> loadData() async {
    debugPrint('MealsProvider.loadData() ${DateTime.now().toIso8601String()}');

    await _loadCategories();
    await _loadMeals();

    // await Future.delayed(const Duration(seconds: 4));

    debugPrint('MealsProvider.loadData() ${DateTime.now().toIso8601String()}');
  }

  Future<void> _saveFavorite(Meal meal) async {
    final url = '$apiUrl/meals/${meal.id}';

    final map = {
      'isFavorite': meal.isFavorite,
    };

    await http.patch(
      Uri.parse(url),
      body: jsonEncode(map),
    );
  }

  Future<void> _loadCategories() async {
    final url = '$apiUrl/categories.json';

    final response = await http.get(
      Uri.parse(url),
    );
    final data = jsonDecode(response.body);
    data.forEach((key, data) {
      data['id'] = key;
      categories.add(Category.fromMap(data));
    });
  }

  Future<void> _loadMeals() async {
    final url = '$apiUrl/meals.json';

    final response = await http.get(
      Uri.parse(url),
    );
    final data = jsonDecode(response.body);
    data.forEach((key, data) {
      data['id'] = key;
      data['categories'] = data['categories']
          .map((id) => categories.firstWhere((category) => category.id == id))
          .toList();
      meals.add(Meal.fromMap(data));
    });
  }

  /*
  Future<void> _saveCategories() async {
    final url = '$apiUrl/categories.json';

    await http.delete(Uri.parse(url));

    final map = <String, dynamic>{};
    for (var category in categories) {
      map[category.id] = category.toMap();
    }

    await http.put(
      Uri.parse(url),
      body: jsonEncode(map),
    );
  }

  Future<void> _saveMeals() async {
    final url = '$apiUrl/meals.json';
    final map = <String, dynamic>{};

    await http.delete(Uri.parse(url));

    for (var meal in meals) {
      map[meal.id] = meal.toMap();
    }
    http.put(
      Uri.parse(url),
      body: jsonEncode(map),
    );
  }
  */
}

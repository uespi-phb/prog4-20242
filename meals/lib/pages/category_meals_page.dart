import 'package:flutter/material.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../widgets/meal_card.dart';

class CategoryMealsPage extends StatelessWidget {
  final Category category;

  const CategoryMealsPage(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealsProvider>(
      context,
      listen: false,
    );
    final meals = provider.mealsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (_, index) => MealCard(meals.elementAt(index)),
      ),
    );
  }
}

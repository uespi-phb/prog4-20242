import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/meal_card.dart';

class CategoryMealsPage extends StatelessWidget {
  final Category category;

  const CategoryMealsPage(
    this.category, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final meals = kMeals.where(
      (meal) => meal.categories.contains(category.id),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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

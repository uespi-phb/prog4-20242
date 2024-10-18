import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import './meal_card.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealsProvider>(
      context,
      listen: true,
    );
    final meals = provider.mealsFavorite();

    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (_, index) => MealCard(meals.elementAt(index)),
    );
  }
}

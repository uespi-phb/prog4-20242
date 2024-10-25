import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_prepare_info_widget.dart';

import '../models/meal.dart';
import '../providers/meals_provider.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal;

  const MealDetailPage(
    this.meal, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealsProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          meal.title,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.toggleFavorite(meal);
        },
        child: Consumer<MealsProvider>(
          builder: (_, __, ___) =>
              Icon(meal.isFavorite ? Icons.star : Icons.star_outline),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
            ),
            MealPrepareInfoWidget(
              title: 'Ingredientes',
              children: meal.ingredients.map((text) => Text(text)).toList(),
            ),
            MealPrepareInfoWidget(
              title: 'Passos',
              children: meal.steps.map((text) => Text(text)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_prepare_info_widget.dart';

import '../models/meal.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal;

  const MealDetailPage(
    this.meal, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          meal.title,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.star),
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

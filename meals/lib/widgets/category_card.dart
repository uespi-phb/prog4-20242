import 'package:flutter/material.dart';
import 'package:meals/app/routes.dart';

import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.green,
      onTap: () => Navigator.of(context).pushNamed(
        Routes.categoryMeals,
        arguments: category,
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import 'category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('CategoriesWidget.build()');

    final provider = Provider.of<MealsProvider>(
      context,
      listen: false,
    );
    final categories = provider.categories;

    debugPrint('CategoriesWidget.build(cats=${categories.length})');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 3 / 2,
        children: categories
            .map(
              (category) => CategoryCard(category),
            )
            .toList(),
      ),
    );
  }
}

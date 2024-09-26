import 'package:flutter/material.dart';

import '../models/categories.dart';
import 'category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: kCategories.length,
    //   itemBuilder: (_, index) => CategoryCard(kCategories[index]),
    // );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 3 / 2,
        children: kCategories
            .map(
              (category) => CategoryCard(category),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/categories.dart';
import '../widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  Widget categoryBuilder(BuildContext context, int index) {
    debugPrint('index: $index/${kCategories.length}');
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(kCategories[index].title),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final categories = <Widget>[];

    // for (var category in kCategories) {
    //   categories.add(Text(category.title));
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: kCategories.length,
        itemBuilder: (_, index) => CategoryCard(kCategories[index]),
      ),
    );
  }
}

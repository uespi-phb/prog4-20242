import 'package:flutter/material.dart';

import '../../models/category.dart';
import 'category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    const categories = Category.values;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const TextSpan(
                text: 'Grocery',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Badge(
                label: const Text('0'),
                child: Icon(
                  Icons.shopping_cart,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              cursorColor: Colors.grey,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.red,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: categories[index],
                    isSelected: index == selectedIndex,
                    onClick: (category) {
                      setState(() {
                        selectedIndex = (selectedIndex != category.index)
                            ? category.index
                            : null;
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 15);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

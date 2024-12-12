import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/providers/product_provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/category_provider.dart';
import './category_tile.dart';
import './product_tile.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    debugPrint('>>>> HomeTab.build()');

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
              child: Consumer(
                builder: (_, ref, __) {
                  final label =
                      ref.watch(cartProvider.notifier).cartItemsCountLabel;
                  return Badge(
                    label: Text(label),
                    child: Icon(
                      Icons.shopping_cart,
                      color: theme.primaryColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Field
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
          // Categories List
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            height: 40,
            child: Consumer(
              builder: (_, ref, __) {
                final categories = ref.read(categoryProvider);

                return ListView.separated(
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
                );
              },
            ),
          ),
          // Product Grid
          Expanded(
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                final products = ref.read(productProvider);

                return GridView.builder(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11,
                  ),
                  itemCount: products.length,
                  itemBuilder: (_, index) => ProductTile(
                    product: products[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

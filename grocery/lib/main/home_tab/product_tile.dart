import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../utils/formatters/currency.dart';
import '../../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    super.key,
    required this.product,
  });

  void _addToCart(int quantity) {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        // Product Card
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productDetail,
              arguments: product,
            );
          },
          child: Card(
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: product.imageUrl,
                      child: Image.asset(product.imageUrl),
                    ),
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        CurrencyFormatter.format(product.price),
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/${product.unit}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // Add to Cart Button
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              debugPrint('Add to Cart: ${product.name}');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white.withAlpha(220),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

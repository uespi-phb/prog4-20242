import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../utils/formatters/currency.dart';

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(
        CurrencyFormatter.format(product.price),
      ),
    );
  }
}

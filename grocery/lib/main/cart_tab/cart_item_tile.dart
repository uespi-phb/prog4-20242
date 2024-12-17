import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/product/quantity_picker.dart';

import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../utils/formatters/currency.dart';

class CartItemTile extends ConsumerWidget {
  final Product product;
  final int quantity;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          CurrencyFormatter.format(product.price),
          style: const TextStyle(
            height: 1.5,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: FractionallySizedBox(
          widthFactor: 0.10,
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        trailing: QuantityPicker(
          quantity,
          sufix: ' ${product.unit}',
          onChange: (value) {
            final cart = ref.read(cartProvider.notifier);
            cart.updateByProduct(product, value - quantity);
          },
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

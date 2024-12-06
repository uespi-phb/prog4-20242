import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/product/quantity_picker.dart';

import '../../models/product.dart';
import '../../provider/cart_provider.dart';
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
    debugPrint('***** build()');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(
          CurrencyFormatter.format(product.price),
        ),
        leading: Image.asset(product.imageUrl),
        trailing: SizedBox(
          width: 120,
          child: QuantityPicker(
            quantity,
            sufix: ' ${product.unit}',
            onChange: (value) {
              // final cart = ref.watch(cartProvider);
              // cart.updateProduct(product, value);
              // debugPrint('q=$value');
            },
          ),
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

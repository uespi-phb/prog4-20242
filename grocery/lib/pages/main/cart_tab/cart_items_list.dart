import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/providers/product_provider.dart';

import 'cart_item_tile.dart';
import '../../../providers/cart_provider.dart';

class CartItemsList extends ConsumerWidget {
  const CartItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final products = ref.read(productProvider);

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (_, index) {
        final productId = cartItems.keys.elementAt(index);
        final product = products.firstWhere((prod) => prod.id == productId);
        return CartItemTile(
          product: product,
          quantity: cartItems[productId]?.quantity ?? 0,
        );
      },
    );
  }
}

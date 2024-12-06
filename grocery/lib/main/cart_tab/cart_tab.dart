import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/cart_provider.dart';

import 'cart_item_tile.dart';

class CartTab extends ConsumerWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: cart.itemCount,
        itemBuilder: (_, index) {
          final cartItem = cart.items[index];
          return CartItemTile(
            product: cartItem.product,
            quantity: cartItem.quantity,
          );
        },
      ),
    );
  }
}

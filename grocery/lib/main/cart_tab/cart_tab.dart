import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/providers/cart_provider.dart';
import 'package:grocery/providers/product_provider.dart';

import 'cart_item_tile.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Consumer(
        builder: (_, ref, __) {
          final cartItems = ref.watch(cartProvider);
          final products = ref.read(productProvider);

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (_, index) {
              final productId = cartItems.keys.elementAt(index);
              final product =
                  products.firstWhere((prod) => prod.id == productId);
              return CartItemTile(
                product: product,
                quantity: cartItems[productId]?.quantity ?? 0,
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/cart_provider.dart';
import '../../provider/product_provider.dart';
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
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final cart = ref.watch(cartProvider);
          final products = ref.watch(productProvider);

          for (final prod in products) {
            cart.updateProduct(prod, 1);
          }

          return ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (_, index) {
              final cartItem = cart.items[index];
              final product =
                  products.firstWhere((prod) => prod.id == cartItem.productId);
              return CartItemTile(
                product: product,
                quantity: cartItem.quantity,
              );
            },
          );
        },
      ),
    );
  }
}

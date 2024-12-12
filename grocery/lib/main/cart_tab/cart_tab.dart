import 'package:flutter/material.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = ref.watch(cartProvider);

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
        itemCount: 0,
        itemBuilder: (_, index) {
          // return CartItemTile(
          //   product: cartItem.product,
          //   quantity: cartItem.quantity,
          // );
          return null;
        },
      ),
    );
  }
}

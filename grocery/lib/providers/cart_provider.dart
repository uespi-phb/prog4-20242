import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

class CartItem {
  final int quantity;
  final double price;

  const CartItem(this.quantity, this.price);

  CartItem copyWith({int? quantity, double? price}) {
    return CartItem(
      quantity ?? this.quantity,
      price ?? this.price,
    );
  }

  @override
  String toString() {
    return '<$quantity, R\$$price>';
  }
}

class ShoppingCart extends Notifier<Map<String, CartItem>> {
  @override
  Map<String, CartItem> build() {
    return {};
  }

  int get cartItemsCount {
    int total = 0;
    state.forEach((_, cartItem) => total += cartItem.quantity);
    return total;
  }

  String get cartItemsCountLabel {
    int total = cartItemsCount;
    return total < 10 ? '$total' : '9+';
  }

  void updateByProduct(Product product, int quantity) {
    final cartItems = Map<String, CartItem>.from(state);
    cartItems.update(
      product.id,
      (cartItem) {
        return cartItem.copyWith(quantity: cartItem.quantity + quantity);
      },
      ifAbsent: () => CartItem(quantity, product.price),
    );

    state = cartItems;

    debugPrint(state.toString());
  }
}

final cartProvider = NotifierProvider<ShoppingCart, Map<String, CartItem>>(
  () => ShoppingCart(),
);

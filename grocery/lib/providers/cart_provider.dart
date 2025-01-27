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
  Map<String, CartItem> build() => {
        '001': const CartItem(3, 2.50),
        '002': const CartItem(1, 10.22),
        '003': const CartItem(8, 9.45),
        '005': const CartItem(2, 7.16),
      };

  int get cartItemsCount {
    int total = 0;
    state.forEach((_, cartItem) => total += cartItem.quantity);
    return total;
  }

  String get cartItemsCountLabel {
    int total = cartItemsCount;
    return total < 10 ? '$total' : '9+';
  }

  double get cartTotalPrice {
    return state.values
        .fold(0, (total, item) => total + item.quantity * item.price);
  }

  void updateByProduct(Product product, int quantity) {
    final cartItems = Map<String, CartItem>.from(state);
    cartItems.update(
      product.id,
      (cartItem) {
        return cartItem.copyWith(quantity: quantity);
      },
      ifAbsent: () => CartItem(quantity, product.price),
    );

    state = cartItems;
  }

  void deleteByProduct(Product product) {
    final cartItems = Map<String, CartItem>.from(state);
    cartItems.remove(product.id);
    state = cartItems;
  }
}

final cartProvider =
    NotifierProvider<ShoppingCart, Map<String, CartItem>>(ShoppingCart.new);

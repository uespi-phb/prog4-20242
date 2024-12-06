import 'package:flutter/foundation.dart';

import 'product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);
}

class Cart extends ChangeNotifier {
  final List<Product> products;
  final _items = <String, int>{};

  Cart(this.products);

  void updateProduct(Product product, int quantity) {
    final key = product.id;
    final int itemQuantity = _items[key] ?? 0;

    _items[key] = itemQuantity + quantity;

    notifyListeners();
  }

  int get itemCount => _items.length;

  List<CartItem> get items {
    final cartItems = <CartItem>[];
    _items.forEach((id, quantity) {
      final product = products.firstWhere((product) => product.id == id);
      cartItems.add(CartItem(product, quantity));
    });
    return cartItems;
  }
}

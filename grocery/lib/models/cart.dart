import 'product.dart';

class CartItem {
  final String productId;
  final int quantity;

  CartItem(this.productId, this.quantity);
}

class Cart {
  final _items = <String, int>{};

  void updateProduct(Product product, int quantity) {
    final key = product.id;
    final int itemQuantity = _items[key] ?? 0;

    _items[key] = itemQuantity + quantity;
  }

  int get itemCount => _items.length;

  List<CartItem> get items {
    final cartItems = <CartItem>[];
    _items.forEach((id, quantity) {
      cartItems.add(CartItem(id, quantity));
    });
    return cartItems;
  }
}

import '../models/product.dart';

class Cart {
  final _items = <String, int>{};

  void updateProduct(Product product, int quantity) {
    final key = product.id;
    final int itemQuantity = _items[key] ?? 0;

    _items[key] = itemQuantity + quantity;
  }
}

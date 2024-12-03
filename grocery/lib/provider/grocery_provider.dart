import 'package:flutter/material.dart';

import '../app/app_data.dart';
import '../models/category.dart';
import '../models/product.dart';
import './cart.dart';

class GroceryProvider with ChangeNotifier {
  final List<Category> categories = AppData.categories;
  final List<Product> products = AppData.products;
  final Cart cart = Cart();

  void updateCart(Product product, int quantity) {
    cart.updateProduct(product, quantity);
  }
}

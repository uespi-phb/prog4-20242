import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/provider/product_provider.dart';

import '../models/cart.dart';

final cartProvider = StateProvider((ref) {
  final products = ref.read(productProvider);

  return Cart(products);
});

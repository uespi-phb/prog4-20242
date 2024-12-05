import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart.dart';

final cartProvider = Provider((_) => Cart());

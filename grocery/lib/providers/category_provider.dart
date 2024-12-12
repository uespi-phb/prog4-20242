import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';

final categoryProvider = Provider((_) => Category.values);

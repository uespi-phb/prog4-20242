import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

final productProvider = Provider((_) => _productData);

const _productData = [
  Product(
    id: '001',
    description:
        'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    imageUrl: 'assets/fruits/apple.png',
    name: 'Maçã',
    price: 5.5,
    unit: 'kg',
  ),
  Product(
    id: '002',
    imageUrl: 'assets/fruits/grape.png',
    name: 'Uva',
    price: 7.4,
    unit: 'kg',
    description:
        'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  ),
  Product(
    id: '003',
    imageUrl: 'assets/fruits/guava.png',
    name: 'Goiaba',
    price: 11.5,
    unit: 'kg',
    description:
        'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  ),
  Product(
    id: '004',
    imageUrl: 'assets/fruits/kiwi.png',
    name: 'Kiwi',
    price: 2.5,
    unit: 'un',
    description:
        'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  ),
  Product(
    id: '005',
    imageUrl: 'assets/fruits/mango.png',
    name: 'Manga',
    price: 2.5,
    unit: 'un',
    description:
        'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  ),
  Product(
    id: '006',
    imageUrl: 'assets/fruits/papaya.png',
    name: 'Mamão papaya',
    price: 8,
    unit: 'kg',
    description:
        'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  ),
];

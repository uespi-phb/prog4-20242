import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './quantity_picker.dart';
import '../providers/cart_provider.dart';
import '../utils/formatters/currency.dart';
import '../models/product.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void addToCart() {
      final cart = ref.read(cartProvider.notifier);
      cart.updateByProduct(widget.product, quantity);
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          // Product Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product Image
              Expanded(
                child: Hero(
                  tag: widget.product.imageUrl,
                  child: Image.asset(widget.product.imageUrl),
                ),
              ),
              // Product Details
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Product Name
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityPicker(quantity,
                              sufix: ' ${widget.product.unit}',
                              minQuantity: 0, onChange: (value) {
                            setState(() {
                              quantity = value;
                            });
                          }),
                        ],
                      ),
                      // Product Price
                      Text(
                        CurrencyFormatter.format(widget.product.price),
                        style: TextStyle(
                          color: theme.primaryColor.withAlpha(230),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Product Description
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              widget.product.description * 3,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Add to Cart Button

                      ElevatedButton.icon(
                        onPressed: quantity > 0 ? addToCart : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor.withAlpha(230),
                        ),
                        label: const Text('Adicionar ao Carrinho'),
                        icon: const Icon(Icons.add_shopping_cart_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Back Button
          const SafeArea(
            child: BackButton(),
          ),
        ],
      ),
    );
  }
}

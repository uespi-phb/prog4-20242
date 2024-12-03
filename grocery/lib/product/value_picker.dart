import 'package:flutter/material.dart';

import './circular_icon_button.dart';

class QuantityPicker extends StatelessWidget {
  final int quantity;
  final int? minQuantity;
  final int? maxQuantity;
  final String? prefix;
  final String? sufix;
  final void Function(int) onChange;

  const QuantityPicker(
    this.quantity, {
    required this.onChange,
    super.key,
    this.prefix,
    this.sufix,
    this.minQuantity,
    this.maxQuantity,
  });

  String get _formatedQuantity {
    final qtyPrefix = prefix ?? '';
    final qtySufix = sufix ?? '';
    return '$qtyPrefix$quantity$qtySufix';
  }

  void _notifyChange(int delta) {
    final newQuantity = quantity + delta;
    if ((minQuantity != null) && (newQuantity < minQuantity!)) {
      return;
    }
    if ((maxQuantity != null) && (newQuantity > maxQuantity!)) {
      return;
    }
    onChange(newQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          // Decrement Button
          CircularIconButton(
            onTap: () => _notifyChange(-1),
            icon: Icons.remove_outlined,
            padding: const EdgeInsets.all(2.5),
            color: Colors.grey,
            iconColor: Colors.white,
          ),
          // Quantity
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              _formatedQuantity,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Incremente Button
          CircularIconButton(
            onTap: () => _notifyChange(1),
            icon: Icons.add_outlined,
            padding: const EdgeInsets.all(2.5),
            color: Theme.of(context).primaryColor,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

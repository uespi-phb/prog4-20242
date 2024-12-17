import 'package:flutter/material.dart';

import './circular_icon_button.dart';

class QuantityPicker extends StatefulWidget {
  final int quantity;
  final int? minQuantity;
  final int? maxQuantity;
  final String? prefix;
  final String? sufix;
  final bool isDisposable;
  final void Function(int) onChange;

  const QuantityPicker(
    this.quantity, {
    super.key,
    required this.onChange,
    this.isDisposable = false,
    this.prefix,
    this.sufix,
    this.minQuantity,
    this.maxQuantity,
  });

  @override
  State<QuantityPicker> createState() => _QuantityPickerState();
}

class _QuantityPickerState extends State<QuantityPicker> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  String get _formatedQuantity {
    final qtyPrefix = widget.prefix ?? '';
    final qtySufix = widget.sufix ?? '';
    return '$qtyPrefix${widget.quantity}$qtySufix';
  }

  void _changeQuantity(int delta) {
    final newQuantity = widget.quantity + delta;
    if (widget.minQuantity != null) {
      if (newQuantity < widget.minQuantity!) {
        if (widget.isDisposable) {
          widget.onChange(newQuantity);
        }
        return;
      }
    }
    if ((widget.maxQuantity != null) && (newQuantity > widget.maxQuantity!)) {
      return;
    }
    setState(() {
      quantity = newQuantity;
    });
    widget.onChange(quantity);
  }

  @override
  Widget build(BuildContext context) {
    final disposable = quantity == widget.minQuantity;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrement Button
          CircularIconButton(
            onTap: () => _changeQuantity(-1),
            icon: disposable ? Icons.delete_forever : Icons.remove_outlined,
            color: disposable ? Colors.red : Colors.grey,
            padding: const EdgeInsets.all(2.5),
            iconColor: Colors.white,
          ),
          // Quantity
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              _formatedQuantity,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Incremente Button
          CircularIconButton(
            onTap: () => _changeQuantity(1),
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

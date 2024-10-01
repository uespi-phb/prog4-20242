import 'package:flutter/material.dart';

class MealPrepareInfoWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MealPrepareInfoWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          width: 250.0,
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color? backgroundColor;

  const InfoCard({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 4.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? Colors.teal,
            size: 12.0,
          ),
          const SizedBox(width: 16.0),
          Text(
            text,
            style: TextStyle(
              color: color ?? Colors.teal,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

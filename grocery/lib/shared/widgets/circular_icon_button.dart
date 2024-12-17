import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;

  const CircularIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
    this.iconColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 12,
          ),
        ),
      ),
    );
  }
}

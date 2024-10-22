import 'dart:ui';

class Category {
  final int id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color.value,
    };
  }
}

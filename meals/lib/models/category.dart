import 'dart:ui';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'color': color.value,
    };
  }

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      title: data['title'],
      color: Color(data['color']),
    );
  }
}

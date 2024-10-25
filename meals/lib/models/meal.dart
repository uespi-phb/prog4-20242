import './category.dart';

enum Complexity {
  simple('Simples'),
  medium('Média'),
  difficult('Alta');

  const Complexity(this.string);
  final String string;
}

enum Cost {
  cheap('Barato'),
  fair('Normal'),
  expensive('Caro');

  const Cost(this.string);
  final String string;
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<Category> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Cost cost;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  bool isFavorite;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.cost,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'categories': categories.map((category) => category.id).toList(),
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'complexity': complexity.index,
      'cost': cost.index,
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'isFavorite': isFavorite,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> data) {
    return Meal(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      complexity: Complexity.values[data['complexity'] ?? 0],
      cost: Cost.values[data['cost'] ?? 0],
      duration: data['duration'] ?? 0,
      imageUrl: data['imageUrl'] ?? '',
      isGlutenFree: data['isGlutenFree'] ?? false,
      isLactoseFree: data['isLactoseFree'] ?? false,
      isVegan: data['isVegan'] ?? false,
      isVegetarian: data['isVegetarian'] ?? false,
      isFavorite: data['isFavorite'] ?? false,
      categories: List.from(data['categories'] ?? [], growable: false),
      ingredients: List.from(data['ingredients'] ?? [], growable: false),
      steps: List.from(data['steps'] ?? [], growable: false),
    );
  }
}

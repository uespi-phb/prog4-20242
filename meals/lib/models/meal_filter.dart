enum MealFilter {
  glutenFree(
    'Sem Glútem',
    'Só exibe refeições sem glútem',
  ),
  lactoseFree(
    'Sem Lactose',
    'Só exibe refeições sem lactose',
  ),
  vegan(
    'Vegano',
    'Só exibe refeições veganas',
  ),
  vegetarian(
    'Vegetariano',
    'Só exibe refeições vegetarianas',
  );

  const MealFilter(this.text, this.description);

  final String text;
  final String description;
}

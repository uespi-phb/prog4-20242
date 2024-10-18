import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal_filter.dart';
import '../providers/meals_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Iterable<Widget> buildFilters(BuildContext context) {
    return MealFilter.values.map(
      (filter) => Consumer<MealsProvider>(
        builder: (_, provider, __) => SwitchListTile(
          value: provider.filters[filter]!,
          onChanged: (value) {
            provider.setFilter(filter, value);
          },
          inactiveTrackColor: Colors.grey.shade400,
          title: Text(
            filter.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(filter.description),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text('Filtros',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          ...buildFilters(context),
        ],
      ),
    );
  }
}

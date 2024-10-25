import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/routes.dart';
import '../providers/meals_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.pink,
            width: double.infinity,
            height: 60.0,
            child: const Center(
              child: Text(
                'Refeições',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Refeições'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(Routes.root);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text('Importar Dados'),
            onTap: () async {
              final provider =
                  Provider.of<MealsProvider>(context, listen: false);
              await provider.loadData();
            },
          ),
        ],
      ),
    );
  }
}

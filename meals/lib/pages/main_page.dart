import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/categories_widget.dart';
import '../widgets/favorites_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loadingData = false;
  int tabIndex = 0;

  @override
  void initState() {
    debugPrint('MainPage.initState()');

    super.initState();

    setState(() {
      loadingData = true;
    });

    final provider = Provider.of<MealsProvider>(context, listen: false);
    final future = provider.loadData();
    future.then((result) {
      debugPrint('future.done()');
      setState(() {
        loadingData = false;
      });
    });
  }

  Widget _bodyWidgetBuilder() {
    if (!loadingData) {
      return (tabIndex == 0)
          ? const CategoriesWidget()
          : const FavoritesWidget();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MainPage.build()');

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          (tabIndex == 0) ? 'Categorias' : 'Favoritos',
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
      body: _bodyWidgetBuilder(),
    );
  }
}

import 'package:flutter/material.dart';

import './home_tab/home_tab.dart';
import 'cart_tab/cart_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageController = PageController(initialPage: pageIndex);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          const HomeTab(),
          const CartTab(),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            pageController.jumpToPage(pageIndex);
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Carrinho',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Pedidos',
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}

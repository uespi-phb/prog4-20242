import 'package:flutter/material.dart';

import 'dices_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rolling Dices'),
      ),
      body: GestureDetector(
        onTap: () {
          debugPrint('MainPage.tap()');
        },
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: DicesCard(),
        ),
      ),
    );
  }
}

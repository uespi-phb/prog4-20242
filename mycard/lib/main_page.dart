import 'package:flutter/material.dart';

import './info_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
            Text(
              'Fulano dos Anzóis',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'DESENVOLVEDOR FLUTTER',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 8.0,
                letterSpacing: 2.0,
              ),
            ),
            Divider(
              thickness: 0.25,
              indent: 50.0,
              endIndent: 50.0,
              color: Colors.white54,
            ),
            InfoCard(
              icon: Icons.phone,
              text: '+55 86 99888-1122',
            ),
            InfoCard(
              icon: Icons.email,
              text: 'fulano.anzois@email.com',
            ),
            // InfoCard(
            //   icon: Icons.star,
            //   text: 'Av da Pesca, 1',
            //   color: Colors.red,
            //   backgroundColor: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}

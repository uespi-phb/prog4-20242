import 'dart:math';

import 'package:flutter/material.dart';

import './dice.dart';

class DicesCard extends StatelessWidget {
  final rnd = Random();

  DicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Dice(rnd),
          ),
        ),
        Expanded(
          flex: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Dice(rnd),
          ),
        ),
      ],
    );
  }
}

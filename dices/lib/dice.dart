import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final Random random;

  const Dice(this.random, {super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int value = 0;

  @override
  void initState() {
    debugPrint('*** initState()');

    super.initState();
    rollDice();
  }

  void tapDice() => rollDice();

  void rollDice() => setState(() {
        value = widget.random.nextInt(6) + 1;
        debugPrint('Dice.tap($value)');
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapDice,
      child: Image.asset('assets/images/dice$value.png'),
    );
  }
}

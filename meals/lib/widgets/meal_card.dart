import 'package:flutter/material.dart';
import 'package:meals/app/routes.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard(
    this.meal, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.mealDetail,
          arguments: meal,
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                    ),
                  ),
                  Positioned(
                    bottom: 15.0,
                    right: 10.0,
                    child: Container(
                      color: Colors.black45,
                      width: 250.0,
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 4.0),
                        Text('99 min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 4.0),
                        Text('Complex'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 4.0),
                        Text('Custo'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

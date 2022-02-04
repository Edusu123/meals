import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void _selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            child: Column(children: [
              Stack(children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(meal.imageUrl,
                        fit: BoxFit.cover, height: 250, width: double.infinity))
              ])
            ]),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onTap: _selectMeal);
  }
}

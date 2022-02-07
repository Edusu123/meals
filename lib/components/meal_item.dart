import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/app-routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.MEAL_DETAIL, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(meal.imageUrl,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity)),
                Positioned(
                  bottom: 20,
                  child: Container(
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    width: 300,
                  ),
                  right: 10,
                )
              ],
            ),
            Padding(
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 3,
                        ),
                        Text('${meal.duration} min')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(meal.complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(meal.costText)
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                padding: const EdgeInsets.all(20))
          ],
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () => _selectMeal(context),
    );
  }
}

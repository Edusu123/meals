import 'package:flutter/material.dart';

import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return Text(categoryMeals[index].title);
            },
            itemCount: categoryMeals.length));
  }
}

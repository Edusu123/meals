import 'package:flutter/material.dart';

import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoriesMealsScreen(category);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            child: Text(category.title,
                style: Theme.of(context).textTheme.headline6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [category.color.withOpacity(0.5), category.color],
                    end: Alignment.bottomRight)),
            padding: const EdgeInsets.all(15)),
        onTap: () => _selectCategory(context),
        splashColor: Theme.of(context).primaryColor);
  }
}

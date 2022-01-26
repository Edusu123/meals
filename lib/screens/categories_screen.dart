import 'package:flutter/material.dart';

import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos cozinhar?'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((e) {
          return CategoryItem(e);
        }).toList(),
      ),
    );
  }
}

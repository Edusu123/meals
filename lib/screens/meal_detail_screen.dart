import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 200,
      width: 330,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
                height: 300,
                width: double.infinity,
              ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(meal.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(Column(
                children: [
                  ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      );
                    },
                    itemCount: meal.steps.length,
                  ),
                  const Divider(),
                ],
              ))
            ],
          ),
        ));
  }
}

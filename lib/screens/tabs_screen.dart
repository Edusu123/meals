import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category), 
                text: 'Categorias',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favoritos',
                )
              ]
            ), 
          title: const Text('Vamos cozinhar?')
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen()
          ],
        ),
      ), 
      length: 2,
    );
  }
}
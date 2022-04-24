import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];
  List<Widget> _screens = [];

  int _selectedScreenIndex = 0;

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      const CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedScreenIndex]),
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
      ),
      drawer: const MainDrawer(),
    );
  }
}

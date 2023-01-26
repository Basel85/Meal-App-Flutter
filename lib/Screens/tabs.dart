import 'package:flutter/material.dart';
import 'package:meal_app/Screens/catagories_Screens.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/meal.dart';

import 'Favourite_Screen.dart';
class Tabs extends StatefulWidget {
  List<Meal> favouriteMeals;
  Tabs(this.favouriteMeals);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int selected_screen=0;
  List<Map<String,Object>> pages;
  initState() {
    pages=[
      {
        'title' : "Categories",
        'page' : catagories_Screens(),
      },
      {
        'title' : "Favourite",
        'page' : Favourites(widget.favouriteMeals),
      },
    ];
    super.initState();
  }
  void selectScreen(int value){
    setState(() {
      selected_screen=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selected_screen]['title']),
      ),
      body: pages[selected_screen]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectScreen,
        backgroundColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            title: Text("Categories")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favourite")
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        currentIndex: selected_screen,
      ),
      drawer: MainDrawer(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Filters_Screen.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget listtile(String text,IconData icon,Function() tap){
    return ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(text,style: TextStyle(fontSize: 24,color : Colors.black,fontWeight: FontWeight.w900,fontFamily: 'RobotoCondensed'),),
      onTap: tap,
    );
  }
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height:120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text("Cooking Up!",
              style: TextStyle(fontSize: 35,color : Theme.of(context).primaryColor,fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 10,),
          listtile("Meal",Icons.restaurant,(){Navigator.of(context).pushNamed('/');}),
          listtile("Filters",Icons.settings,(){Navigator.of(context).pushNamed(Filters.Filter_route);}),
        ],
      ),
    );
  }
}

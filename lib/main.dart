import 'package:flutter/material.dart';
import 'package:meal_app/Dummy_data.dart';
import 'package:meal_app/Screens/Filters_Screen.dart';
import 'package:meal_app/meal.dart';
import 'Screens/catagories_Screens.dart';
import 'Screens/catagories_meal_screen.dart';
import 'Screens/meal_detail_screen.dart';
import 'Screens/tabs.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String ,bool>filters={
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };
  List<Meal> avaliablemeals=DUMMY_MEALS;
  List<Meal> favouritemeals=[];
  void setfilters(Map<String ,bool>filtersdata){
    setState(() {
      filters=filtersdata;
      avaliablemeals=DUMMY_MEALS.where((meal) {
        if(filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
    }).toList();
    });
  }
  String togglemeals(String mealId){
    final existingIndex=favouritemeals.indexWhere((meal) => meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        favouritemeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouritemeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool cc(String id){
    return favouritemeals.any((meal)=>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color.fromRGBO(245, 198, 123, 0.3),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(245, 198, 123, 0.3),
          ),
          title: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoCondensed',
          )
        ),
      ),
      //home: MyHomePage(),
      routes: {
        '/':(context)=>Tabs(favouritemeals),
        '/route_of_screen':(context)=>catagoriesmealscreen(avaliablemeals),
        mealdetails.route : (context)=>mealdetails(togglemeals,cc),
        Filters.Filter_route : (context)=>Filters(setfilters,filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meal app",style: Theme.of(context).textTheme.title,),
      ),
      body: catagories_Screens(),
    );
  }
}

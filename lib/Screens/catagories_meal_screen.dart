import 'package:flutter/material.dart';
import 'package:meal_app/meal.dart';
import'../Dummy_data.dart';
import '../Widgets/meal_item.dart';
class catagoriesmealscreen extends StatefulWidget {
 List<Meal> avaliablemeals;
 catagoriesmealscreen(this.avaliablemeals);
  @override
  _catagoriesmealscreen createState() => _catagoriesmealscreen();
}

class _catagoriesmealscreen extends State<catagoriesmealscreen> {
  @override
  Widget build(BuildContext context) {
    final routearg=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final catagoryID=routearg['id'];
    final catagorytitle=routearg['title'];
    final catagorymeals=widget.avaliablemeals.where((meal)  {
      return meal.catagories.contains(catagoryID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catagoryID),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return mealitem(
          image : catagorymeals[index].imageUrl,
          title: catagorymeals[index].title,
          duration: catagorymeals[index].duration,
          complexity: catagorymeals[index].complexity,
          affordability: catagorymeals[index].affordability,
          id : catagorymeals[index].id,
        );
      },
      itemCount: catagorymeals.length,
      ),
    );
  }
}

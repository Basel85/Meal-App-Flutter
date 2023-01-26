import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import '../meal.dart';
class Favourites extends StatelessWidget {
   List<Meal> favouriteMeals;
   Favourites(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text("Hello"),
      );
    }
    else {
      return ListView.builder(itemBuilder: (ctx,index){
        return mealitem(
          image : favouriteMeals[index].imageUrl,
          title: favouriteMeals[index].title,
          duration: favouriteMeals[index].duration,
          complexity: favouriteMeals[index].complexity,
          affordability: favouriteMeals[index].affordability,
          id : favouriteMeals[index].id,
        );
      },
        itemCount: favouriteMeals.length,
      );
  }
  }
}

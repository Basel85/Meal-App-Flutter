import 'package:flutter/material.dart';
import 'package:meal_app/Screens/meal_detail_screen.dart';
import 'package:meal_app/meal.dart';
class mealitem extends StatelessWidget {
  final image;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  mealitem({
     required this.image, required this.title,  required this.duration, required this.complexity, required this.affordability,required this.id
});
  String get complexitytext{
    switch(complexity){
      case Complexity.Simple : return "Simple";
      case Complexity.Challenging : return "Challenging";
      case Complexity.Hard : return "Hard";
      default : return "Unknown";
    }
  }
  String get affordablilitytext{
    switch(affordability){
      case Affordability.Affordable : return "Affordable";
      case Affordability.Luxurious : return "Luxurious";
      case Affordability.Pricey : return "Pricey";
      default : return "Unknown";
    }
  }
  void selectScreen(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      mealdetails.route,
      arguments: id,
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectScreen(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(image),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding : EdgeInsets.all(15),
                    width : 300,
                    color: Colors.black54,
                    child: Text(title,style: TextStyle(fontSize: 23,color: Colors.white),softWrap: true,overflow: TextOverflow.fade,),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_alarm),
                    SizedBox(width: 6,),
                    Text("$duration min",style: TextStyle(color: Colors.black),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 6,),
                    Text("$complexitytext ",style: TextStyle(color: Colors.black),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    Text("$affordablilitytext ",style: TextStyle(color: Colors.black),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

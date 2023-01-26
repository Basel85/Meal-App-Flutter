import 'package:flutter/material.dart';
import 'package:meal_app/Dummy_data.dart';
import '../meal.dart';

class mealdetails extends StatelessWidget {
  static const route = '/mealdetailroute';
  Function togglemeals;
  Function cc;
  mealdetails(this.togglemeals,this.cc);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    Widget Build_container1(BuildContext ctx,String text){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text,style: Theme.of(ctx).textTheme.title,),
      );
    }
    Widget Build(Widget child){
      return child;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body:SingleChildScrollView(
          child :Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedmeal.imageUrl,fit: BoxFit.cover,),
              ),
              Build_container1(context,"Ingredients"),
              Build(Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (ctx,index){
                    return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: Text(selectedmeal.ingredients[index],style:Theme.of(context).textTheme.title,),
                        )
                    );
                  },
                  itemCount: selectedmeal.ingredients.length,
                ),
              ),),
              Build_container1(context,"Steps"),
              Build(Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (ctx,index){
                    return ListTile(
                        leading:CircleAvatar(
                          child: Text("# ${index+1}"),
                        ),
                        title: Text(selectedmeal.steps[index],),
                    );
                  },
                  itemCount: selectedmeal.steps.length,
                ),
              ),)
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> togglemeals(mealId),
        child: Icon(
          cc(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}

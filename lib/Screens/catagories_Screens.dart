import 'package:flutter/material.dart';
import 'package:meal_app/Dummy_data.dart';
import 'package:meal_app/Widgets/catagoriesItem.dart';

class catagories_Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meal",style: Theme.of(context).textTheme.title,),
      ),

      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (e) => catagoriesItem(e.title, e.color, e.id),
        )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}

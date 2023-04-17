import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class catagoriesItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const catagoriesItem( this.title, this.color, this.id);
  void selected_Screen(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/route_of_screen',
      arguments: {
        'id' : id,
        'title': title,
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selected_Screen(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

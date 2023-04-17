import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const Filter_route = '/filter_route';
  Function savefilters;
  final Map<String ,bool>currentFilters;
  Filters(this.savefilters,this.currentFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegan = false;

  bool isVegetarian = false;
  initState(){
    isGlutenFree=widget.currentFilters['gluten']!;
    isLactoseFree=widget.currentFilters['lactose']!;
    isVegan = widget.currentFilters['vegan']!;
    isVegetarian=widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget Filters(String title, String subtitle, bool filter, Function(bool) s) {
    return SwitchListTile(
      title: Text(title),
      value: filter,
      onChanged: s,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(
            icon : Icon(Icons.save),
            onPressed: (){
              final Map<String ,bool> selectedfilters={
                'gluten' : isGlutenFree,
                'lactose' : isLactoseFree,
                'vegan' : isVegan,
                'vegetarian' : isVegetarian,
              };
              widget.savefilters(selectedfilters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Filters(
                  "Gluten-free",
                  "Only include gluten-free meals",
                  isGlutenFree,
                  (newvalue) {
                    setState(() {
                      isGlutenFree = newvalue;
                    });
                  },
                ),
                Filters(
                  "Lactose-free",
                  "Only include lactose-free meals",
                  isLactoseFree,
                  (newvalue) {
                    setState(() {
                      isLactoseFree = newvalue;
                    });
                  },
                ),
                Filters(
                  "Vegan",
                  "Only include vegan meals",
                  isVegan,
                  (newvalue) {
                    setState(() {
                      isVegan = newvalue;
                    });
                  },
                ),
                Filters(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  isVegetarian,
                  (newvalue) {
                    setState(() {
                      isVegetarian = newvalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

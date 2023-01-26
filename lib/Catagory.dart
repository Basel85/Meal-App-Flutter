import 'package:flutter/material.dart';
class Category {
   final String title;
   final Color color;
   final String id;

   const Category(
      {
        @required this.title,
        this.color = Colors.red,
        @required this.id,
      }
      );
}

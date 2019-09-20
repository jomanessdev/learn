import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/constants/constants.dart';

class SelectCategory extends StatelessWidget{
  var selectedCategory;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(icon: Icon(Icons.shopping_basket),onPressed: (){
          this.selectedCategory = Category.CLOTHING;
        },)
      ],
    );
  }
}
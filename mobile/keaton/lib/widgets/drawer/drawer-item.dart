import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerItem extends StatelessWidget{

  String itemName;
  IconData itemIcon;
  String itemUrl;

  DrawerItem(this.itemName, this.itemIcon, this.itemUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.itemIcon),
      title: Text(this.itemName),
      onTap: () {
        //TODO write code that validates for bad URL string and ensure constructor makes this variable required
        Navigator.pushReplacementNamed(context, '${this.itemUrl}');
      },
    );
  }
}
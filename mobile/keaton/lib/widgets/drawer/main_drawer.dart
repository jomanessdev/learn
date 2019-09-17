import 'package:flutter/material.dart';
import 'package:keaton/pages/clothing.dart';
import 'package:keaton/pages/kitchen.dart';
import 'package:keaton/pages/tools.dart';
import 'package:keaton/widgets/drawer/drawer-item.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerItem('Clothing', Icons.shopping_basket, ClothingPage.routeName),
          DrawerItem('Tools', Icons.work, ToolsPage.routeName),
          DrawerItem('Kitchen', Icons.kitchen, KitchenPage.routeName),
        ],
      ),
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:keaton/pages/add_item_page.dart';
import 'package:keaton/pages/clothing.dart';
import 'package:keaton/pages/home.dart';
import 'package:keaton/pages/kitchen.dart';
import 'package:keaton/pages/tools.dart';
import 'package:keaton/pages/view_item_page.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: StoredItems(),
      child: MaterialApp(
      title: 'Prototype',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Montserrat'
      ),
      initialRoute: ClothingPage.routeName,
      routes: {
        HomePage.routeName : (context) => HomePage(title: 'Home'),
        ClothingPage.routeName: (context) => ClothingPage(title: 'My Closet'),
        ToolsPage.routeName: (context) => ToolsPage(title: 'My Toolbox'),
        KitchenPage.routeName: (context) => KitchenPage(title: 'My Kitchen'),
        AddItemsPage.routeName: (context) => AddItemsPage(),
        ViewItemPage.routeName: (context) => ViewItemPage()
      },
    ));
  }
}
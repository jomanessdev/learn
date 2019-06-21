import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/custom_drawer.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: CustomDrawer('Manage Products','/admin'),
        appBar: AppBar(
          title: Text('Flutter Course'),
        ),
        body: ProductManager()
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/custom_drawer.dart';
import 'package:flutter_course/pages/product_create_page.dart';
import 'package:flutter_course/pages/product_list_page.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: CustomDrawer('View Products', '/'),
            appBar: AppBar(
              title: Text('Product Management'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'Create Product', icon: Icon(Icons.create),),
                  Tab(text: 'My Products', icon: Icon(Icons.list),)
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ProductCreatePage(),
                ProductListPage()
              ],
            ),
            ));
  }
}

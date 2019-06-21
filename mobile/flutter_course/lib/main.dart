import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_admin.dart';

import 'pages/productDetails_page.dart';
import 'pages/products_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  final List<Map<String,String>> _products = [];

  void _addProduct(Map<String,String> product){
    setState(() {
     _products.add(product); 
    });
    print(_products);
  }

  void _deleteProduct(int index){
    setState(() {
     _products.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.purple,
        brightness: Brightness.light
      ),
      routes: {
        '/': (BuildContext context) => ProductsPage(),
        '/admin' : (BuildContext context) => ProductAdminPage()
      },
      onGenerateRoute: (RouteSettings settings){

        final List<String> pathElements = settings.name.split('/');

        if(pathElements[0] != ''){
          print('You must place a forward slash before the route name. Skipping route command. ');
          return null;
        }

        if(pathElements[1] == 'product'){
          return MaterialPageRoute(builder: (BuildContext context) {
                      return ProductDetails(_products[index]);
                    });
        }
        return null;
      },
    );
  }
}
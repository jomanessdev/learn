import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Authenticate'),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductsPage()));
        },
        child: Text('Login'),
      )),
    );
  }
}

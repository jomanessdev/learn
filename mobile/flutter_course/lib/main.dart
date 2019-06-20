import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.purple,
        brightness: Brightness.light
      ),
      home: AuthPage(),
    );
  }
}
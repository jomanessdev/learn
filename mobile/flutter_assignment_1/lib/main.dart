import 'package:flutter/material.dart';
import 'package:flutter_assignment_1/text_control.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('A Whole New Wolrd')
        ),
        body: TextControl('initialValueOFText'),
      )
    );
  }
}
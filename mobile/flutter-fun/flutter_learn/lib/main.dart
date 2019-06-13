import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
     home: MyHomePage(title: 'Home Page Title'),
   );
  }
}

class MyHomePage extends StatefulWidget{

  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>{

  var _counter = 0;
  var _someText = 'Hello World';

  void _buttonPressed(){
    setState(() {
     _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          Text(_someText),
          RaisedButton(child: Text('Press Me'),onPressed: _buttonPressed,),
          Text('Incremented number: $_counter')
        ],
      )
    );
  }
}


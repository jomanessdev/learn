import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bluetooth_page.dart';
import 'calendar_page.dart';
import 'camera_page.dart';
import 'home_page.dart';
import 'messages_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     home: MyAppWrapper(title: 'Learning is Fun'),
    );
  }
}

class MyAppWrapper extends StatefulWidget {
  final String title;

  MyAppWrapper({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppWrapperState();
  }
}

class MyAppWrapperState extends State<MyAppWrapper> {
  var _selectedIndex = 0;
  final List<Widget> _pages = [
    MyHomePage(),
    MyCameraPage(),
    MyCalendarPage(),
    MyBluetoothPage(),
    MyMessagesPage()
  ];

  void _changePageTo(int _index) {
    setState(() {
     _selectedIndex = _index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera, color: Colors.grey),
                title: Text('Camera')),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today, color: Colors.grey),
                title: Text('Calendar')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bluetooth,
                  color: Colors.grey,
                ),
                title: Text('Bluetooth')),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Colors.grey,
              ),
              title: Text('Messages'),
            )
          ],
          fixedColor: Colors.amber,
          onTap: _changePageTo,
          currentIndex: _selectedIndex,
        ));
  }
}

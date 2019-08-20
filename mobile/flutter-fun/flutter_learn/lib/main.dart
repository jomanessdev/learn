import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bluetooth_page.dart';
import 'calendar_page.dart';
import 'camera_page.dart';
import 'home_page.dart';
import 'messages_page.dart';

import 'package:camera/camera.dart';

Future<void> main() async{
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(firstCamera));

}

class MyApp extends StatelessWidget {

  final camera;

  MyApp(this.camera);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     home: MyAppWrapper(title: 'Learning is Fun', camera: this.camera),
    );
  }
}

class MyAppWrapper extends StatefulWidget {
  final String title;
  final camera;

  MyAppWrapper({Key key, this.title, this.camera}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppWrapperState();
  }
}

class MyAppWrapperState extends State<MyAppWrapper> {
  var _selectedIndex = 0;
  final List<Widget> _pages = [
    MyHomePage(),
    MyCameraPage(camera: widget.camera),
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

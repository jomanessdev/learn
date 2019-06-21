import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDrawer extends StatelessWidget{

  final String replacementPageTitle;
  final String replacementPath;

  CustomDrawer(this.replacementPageTitle, this.replacementPath);

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(children: <Widget>[
            AppBar(title: Text('Chose'), automaticallyImplyLeading: false,),
            ListTile(
              title: Text(replacementPageTitle),
              onTap: (){
                Navigator.pushReplacementNamed(context,replacementPath);
              },
            )
          ],),
        );
  }
  
}
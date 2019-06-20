import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDrawer extends StatelessWidget{

  final Widget replacementPage;
  final String replacementPageTitle;

  CustomDrawer(this.replacementPageTitle, this.replacementPage);

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(children: <Widget>[
            AppBar(title: Text('Chose'), automaticallyImplyLeading: false,),
            ListTile(
              title: Text(replacementPageTitle),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => replacementPage));
              },
            )
          ],),
        );
  }
  
}
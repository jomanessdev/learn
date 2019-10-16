import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetailsContainer extends StatelessWidget{
  final IconData icon;
  final String name;
  final String value;

  ItemDetailsContainer(this.name,this.value,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(this.icon, size: 50),
                Text(this.value,)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Center(child:Text(this.name, style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }

}
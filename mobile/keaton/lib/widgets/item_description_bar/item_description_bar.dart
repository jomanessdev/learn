import 'package:flutter/material.dart';

class ItemDescriptionBar extends StatelessWidget{
  final List<String> descItems;

  ItemDescriptionBar({@required this.descItems});

  List<Widget> _buildChildren(){
    List<Widget> results = [];
    for(int i = 0; i<descItems.length; i++){
      results.add(Text(this.descItems[i]));
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child:Row(
        children: _buildChildren(),
        mainAxisSize: MainAxisSize.max,
      )
    );
  }
  
}
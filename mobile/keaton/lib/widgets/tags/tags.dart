import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  final List<dynamic> items;

  Tags({this.items});

  List<Widget> _buildTags(BuildContext context) {
    List<Widget> results = [];
    for (dynamic tag in this.items) {
      results.add(Container(
          margin: EdgeInsets.all(3),
          child: Chip(
        label: Text(tag,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300
            )),
        backgroundColor: Theme.of(context).primaryColor,
      )));
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50,child: ListView(scrollDirection: Axis.horizontal,children: _buildTags(context)));
  }
}

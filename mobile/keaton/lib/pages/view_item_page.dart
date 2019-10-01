import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:keaton/widgets/tags/tags.dart';
import 'package:provider/provider.dart';

class ViewItemPage extends StatelessWidget {
  static const routeName = 'view-item';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedItem =
        Provider.of<StoredItems>(context, listen: false).findItemById(id);

    return Scaffold(
      appBar: AppBar(
          // title: Text(selectedItem.name),
          ),
      body: Column( //TODO make this a listview so it can scroll
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            //TODO remove border
            // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Image.file(selectedItem.image,
                fit: BoxFit.cover, width: double.infinity),
            padding: EdgeInsets.all(10),
          ), //Picture container
          SizedBox(
            height: 5,
          ),
        Expanded(child:
        Container(
            height: 500,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            //TODO remove border
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      selectedItem.name,
                      textAlign: TextAlign.left,
                      textScaleFactor: 2,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text('Tags', textScaleFactor: 1.25 ,style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w100))
                  ])),
              Divider(
                color: Colors.grey,
                indent: 5,
                endIndent: 5,
              ),
              Tags(items: ['one','two','three', 'four','five','six','seven','eight','nine','ten'],),
              SizedBox(height: 20,),
              Container(width: double.infinity, child: Text('Details',textScaleFactor: 1.25, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w100))),
              Expanded(
                flex: 2,
                child: Container(
                  height: 150,
                color: Colors.green,
              ))
            ]))),
      ]),
    );
  }
}

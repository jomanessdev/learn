import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/pages/clothing.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:keaton/widgets/item_details_container/item_details_container.dart';
import 'package:keaton/widgets/tags/tags.dart';
import 'package:provider/provider.dart';

class ViewItemPage extends StatelessWidget {
  static const routeName = 'view-item';

  //TODO 1. Add ability to change picture. 2. Add ability to add tags.

  String _parseDate(String _inputDate){
    DateTime dt = DateTime.parse(_inputDate);
    return '${dt.month}.${dt.day}.${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedItem = Provider.of<StoredItems>(context, listen: false).findItemById(id);
    return Scaffold(
      appBar: AppBar(
          // title: Text(selectedItem.name),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.of(context).pushReplacementNamed(ClothingPage.routeName);
          },),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
      body: ListView(
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
              Tags(items: [selectedItem.colorName, selectedItem.season],),
              SizedBox(height: 20,),
              Container(width: double.infinity, child: Text('Details',textScaleFactor: 1.25, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w100))),
              Expanded(
                // height: double.infinity,
                // width: double.infinity,
                child: 
                  GridView.count(
                    crossAxisCount: 2,
                    children: <Widget>[
                      ItemDetailsContainer('Brand', selectedItem.brand, Icons.bookmark_border),
                      ItemDetailsContainer('Purchased', this._parseDate(selectedItem.createdDate), Icons.shopping_cart),
                      ItemDetailsContainer('Size', selectedItem.size, Icons.straighten),
                      ItemDetailsContainer('Times Worn', selectedItem.timesWorn.toString(), Icons.repeat)
                    ],
                  ),
                  // Container(child: Text('LAST TIME WORN'),)
              )
            ])),
      ]),
    );
  }
}

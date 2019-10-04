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
              Tags(items: ['one','two','three', 'four','five','six','seven','eight','nine','ten'],),
              SizedBox(height: 20,),
              Container(width: double.infinity, child: Text('Details',textScaleFactor: 1.25, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w100))),
              
              //Details container
              Container(
                height: 200,
                child:
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.purple, 
                            child: Column(
                              children: <Widget>[

                                //Begin first panel row
                                Expanded(
                                  child: Container(
                                    color: Colors.blue,
                                    width: double.infinity,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(child: Container(color: Colors.yellow)),
                                        Expanded(child: Container(color: Colors.brown))
                                      ]
                                    )
                                  )
                                ),
                                // End first panel row

                                //Begin second panel row
                                Expanded(
                                  child: Container(
                                    color: Colors.blue,
                                    width: double.infinity,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(child: Container(color: Colors.orange)),
                                        Expanded(child: Container(color: Colors.grey))
                                      ]
                                    )
                                  )
                                ),
                                //End second panel row

                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container(color: Colors.green.withOpacity(0.2)))
                      ],
                    )
                  )
              )
            ])),
      ]),
    );
  }
}

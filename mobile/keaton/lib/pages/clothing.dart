import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keaton/helpers/camera_helper.dart';
import 'package:keaton/helpers/color_icon_helper.dart';
import 'package:keaton/helpers/season_icon_helper.dart';
import 'package:keaton/pages/add_item_page.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:keaton/widgets/drawer/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/pages/view_item_page.dart';

class ClothingPage extends StatefulWidget {
  static const routeName = "clothing";

  ClothingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClothingPageState createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  Future<void> _openDeletePrompt(String itemId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Would you like to permanately delete this item? '),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('No'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              color: Colors.white,
              child: Text('Yes'),
              onPressed: () {
                //Todo remove hardcoded
                Provider.of<StoredItems>(context, listen: false)
                    .deleteItem(Constants.CLOTHING_TABLE, itemId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    String giveMeSize(String input){
      if(input == null || input.isEmpty){
        return "?";
      }

      if(input.length == 1){
        return input.toUpperCase();
      }

      if(input.length == 2){
        return input.toUpperCase();
      }

      if(input.length >= 3){
        String t1 = input[0];
        String t2 = input[1];
        String t3 = input[2];

        if(double.tryParse(t1) !=null && double.tryParse(t2) != null && t3 == '.'){ 
          if(input.length >=4) return input.substring(0,4);
          return t1+t2; 
        } 
        if(double.tryParse(t1) !=null && double.tryParse(t2) != null) return t1+t2; //return waist part of size
        if(t1.toLowerCase() == 'x' && t2.toLowerCase() != 'x') return t1.toUpperCase() + t2.toUpperCase();
        if(t1.toLowerCase() == 'x' && t2.toLowerCase() == 'x') return input.toLowerCase().allMatches('x').length.toString() + 'X'; //return 2X or 3X or 4X etc..
        if(input.toLowerCase().contains('small')) return 'S';
        if(input.toLowerCase().contains('medium')) return 'M';
        if(input.toLowerCase().contains('large')) return 'L';

        return input.substring(0,2).toUpperCase();
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).bottomAppBarColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () async {
          final pictureFile = await CameraHelper.takePicture();
          if (pictureFile == null) {
            return;
          }
          Navigator.of(context)
              .pushNamed(AddItemsPage.routeName, arguments: pictureFile);
        },
        tooltip: 'Add New Item',
        child: Icon(Icons.add, color: Theme.of(context).accentColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: MainDrawer(),
      body: FutureBuilder(
          future: Provider.of<StoredItems>(context, listen: false)
              .fetchItemsAndSet(Constants.CLOTHING_TABLE),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<StoredItems>(
                  child: Center(
                    child: Text('No clothes yet.'),
                  ),
                  builder: (context, storedItems, child) => storedItems
                              .items.length <=
                          0
                      ? child
                      : GridView.builder(
                          padding: EdgeInsets.all(5),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemCount: storedItems.items.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onLongPress: () {
                                  _openDeletePrompt(
                                      storedItems.items[index].id);
                                },
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      ViewItemPage.routeName,
                                      arguments: storedItems.items[index].id);
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey.withOpacity(1), blurRadius: 2, spreadRadius:1, offset: Offset.fromDirection(120))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: 
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Container(
                                            child: 
                                              Expanded( child: 
                                                Image(
                                                  image: FileImage(
                                                      storedItems.items[index].image),
                                                  alignment: Alignment.center,
                                                  fit: BoxFit.cover,
                                                )
                                              )
                                        ),
                                      Container( 
                                        child: Column(children: <Widget>[                                              
                                              Container(height: 30, width: double.infinity, child: Container(child:Text(storedItems.items[index].name, textScaleFactor: 1.5, overflow: TextOverflow.ellipsis,))),
                                              Row(                                        
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Flexible(
                                                  child: Container(
                                                    child: Text(storedItems.items[index].brand, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey),)
                                                  ),
                                                ),
                                                Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                Container(
                                                  child: SeasonIconHelper.giveMeTheSeasonIcon(storedItems.items[index].season, iconSize: 24, color: Colors.grey.withOpacity(0.6)),
                                                ),
                                                Container(
                                                  child: ColorIconHelper.giveMeTheColorIcon(storedItems.items[index].colorName, 24, iconOpacity: 0.6)
                                                ),
                                                Container(
                                                  width: 40, // TODO MEDIA QUERY
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.grey.withOpacity(0.6)),
                                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                                    ),
                                                    child: Text(giveMeSize(storedItems.items[index].size), textAlign: TextAlign.center),
                                                    alignment: Alignment.center,
                                                  )
                                                ) ])
                                              ])
                                            ])),
                                    ])),
                              )),
                )),
    );
  }
}

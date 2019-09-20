import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keaton/helpers/camera_helper.dart';
import 'package:keaton/pages/add_item_page.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:keaton/widgets/item_description_bar/item_description_bar.dart';
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
              Provider.of<StoredItems>(context, listen: false).deleteItem(Constants.CLOTHING_TABLE, itemId);
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
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title), centerTitle: true, elevation: 0.0),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final pictureFile = await CameraHelper.takePicture();
            if(pictureFile == null){
              return;
            }
            Navigator.of(context).pushNamed(AddItemsPage.routeName, arguments: pictureFile);
          },
          tooltip: 'Add New Item',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // drawer: MainDrawer(),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: Provider.of<StoredItems>(context, listen: false)
                .fetchItemsAndSet(Constants.CLOTHING_TABLE),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<StoredItems>(
                    child: Center(
                      child: Text('No items in your closet.'),
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
                                  onLongPress: (){
                                    _openDeletePrompt(storedItems.items[index].id);
                                  },
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ViewItemPage.routeName,
                                        arguments: storedItems.items[index].id);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Column(children: <Widget>[
                                      Expanded(
                                          child: Image( 
                                            image: FileImage(storedItems.items[index].image),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                          )
                                      ),
                                      Container(
                                        child: Column(children: <Widget>[
                                            Text(storedItems.items[index].name),
                                            ItemDescriptionBar(descItems: <String>['Lane Bryant','Size 3','Last Worn Aug. 3 2019'])
                                          ]),
                                        height: 30,
                                        width: double.infinity,
                                        decoration: BoxDecoration(color: Colors.blue),
                                      )
                                    ]),
                                  ),
                                )),
                  )));
  }
}

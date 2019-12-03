import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keaton/helpers/camera_helper.dart';
import 'package:keaton/pages/add_item_page.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:keaton/widgets/filter/filter_list.dart';
import 'package:keaton/widgets/item_tile/item_tile.dart';
import 'package:provider/provider.dart';
import 'package:keaton/constants/constants.dart';

class ClothingPage extends StatefulWidget {
  static const routeName = "clothing";

  ClothingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClothingPageState createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  Set<String> brandsToFilterOn = new Set();
  // Set<FilterMeta> selectedFilterValues = new Set();

  void _openBrandFilter() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("Select Brand(s)"),
              children: <Widget>[
                Container(
                  child: FutureBuilder(
      future: Provider.of<StoredItems>(context, listen: false).fetchAllBrands(Constants.CLOTHING_TABLE),
      builder: (context, snapshot) => 
        snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator()) 
        : Consumer<StoredItems>(
            child: Center(child: Text('Could not load any brands'),),
            builder: (context, storedItems, child) => storedItems.brands.length <= 0
            ? child : Container(
                        width: 400,
                        height: 200,
                        child:
                          FilterList(Constants.BRAND_COLUMN_NAME, storedItems.brands, () => {
                          })
                      )
                    )
                  )
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).buttonColor,
                      child: Text('Ok'),
                      onPressed: () {
                        Provider.of<StoredItems>(context).updateFilterAndFetchResults(Constants.CLOTHING_TABLE);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ));

  }

  void _openColorFilter() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("Select Color(s)"),
              children: <Widget>[
                Container(
                  child: FutureBuilder(
      future: Provider.of<StoredItems>(context, listen: false).fetchAllColors(Constants.CLOTHING_TABLE),
      builder: (context, snapshot) => 
        snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator()) 
        : Consumer<StoredItems>(
            child: Center(child: Text('Could not load any colors'),),
            builder: (context, storedItems, child) => storedItems.colors.length <= 0
            ? child : Container(
                        width: 400,
                        height: 200,
                        child:
                          FilterList(Constants.COLORNAME_COLUMN_NAME, storedItems.colors, () => {
                          })
                      )
                    )
                  )
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).buttonColor,
                      child: Text('Ok'),
                      onPressed: () {
                        Provider.of<StoredItems>(context).updateFilterAndFetchResults(Constants.CLOTHING_TABLE);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ));

  }

  void _openSizesFilter() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("Select Sizes(s)"),
              children: <Widget>[
                Container(
                  child: FutureBuilder(
      future: Provider.of<StoredItems>(context, listen: false).fetchAllSizes(Constants.CLOTHING_TABLE),
      builder: (context, snapshot) => 
        snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator()) 
        : Consumer<StoredItems>(
            child: Center(child: Text('Could not load any colors'),),
            builder: (context, storedItems, child) => storedItems.sizes.length <= 0
            ? child : Container(
                        width: 400,
                        height: 200,
                        child:
                          FilterList(Constants.SIZE_COLUMN_NAME, storedItems.sizes, () => {
                          })
                      )
                    )
                  )
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).buttonColor,
                      child: Text('Ok'),
                      onPressed: () {
                        Provider.of<StoredItems>(context).updateFilterAndFetchResults(Constants.CLOTHING_TABLE);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ));
  }

  void _openTypeFilter() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("Select Type(s)"),
              children: <Widget>[
                Container(
                  child: FutureBuilder(
      future: Provider.of<StoredItems>(context, listen: false).fetchAllTypes(Constants.CLOTHING_TABLE),
      builder: (context, snapshot) => 
        snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator()) 
        : Consumer<StoredItems>(
            child: Center(child: Text('Could not load any types'),),
            builder: (context, storedItems, child) => storedItems.types.length <= 0
            ? child : Container(
                        width: 400,
                        height: 200,
                        child:
                          FilterList(Constants.TYPE_COLUMN_NAME, storedItems.types, () => {
                          })
                      )
                    )
                  )
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).buttonColor,
                      child: Text('Ok'),
                      onPressed: () {
                        Provider.of<StoredItems>(context).updateFilterAndFetchResults(Constants.CLOTHING_TABLE);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
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

                  child: 
                  Column(
                    children: <Widget>[
                      Row(
                            children: <Widget>[
                            FlatButton.icon(
                              icon: Icon(Icons.label),
                              label: Text('Brand'),
                              onPressed: _openBrandFilter,
                              textColor: Colors.grey.withOpacity(1),
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.color_lens),
                              label: Text('Color'),
                              onPressed: _openColorFilter,
                              textColor: Colors.grey.withOpacity(1),
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.straighten),
                              label: Text('Size'),
                              textColor: Colors.grey.withOpacity(1),
                              onPressed: _openSizesFilter,
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.store),
                              label: Text('Type'),
                              onPressed: _openTypeFilter,
                              textColor: Colors.grey.withOpacity(1),
                            )
                          ],),
                          Center(
                            child: Text('No clothes yet.'),
                          ),
                    ],),
                  builder: (context, storedItems, child) => storedItems
                              .items.length <=
                          0
                      ? child
                      : 
                        Column(
                          children: <Widget>[
                          Row(
                            children: <Widget>[
                            FlatButton.icon(
                              icon: Icon(Icons.label),
                              label: Text('Brand'),
                              onPressed: _openBrandFilter,
                              textColor: Colors.grey.withOpacity(1),
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.color_lens),
                              label: Text('Color'),
                              onPressed: _openColorFilter,
                              textColor: Colors.grey.withOpacity(1),
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.straighten),
                              label: Text('Size'),
                              textColor: Colors.grey.withOpacity(1),
                              onPressed: _openSizesFilter,
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.store),
                              label: Text('Type'),
                              onPressed: _openTypeFilter,
                              textColor: Colors.grey.withOpacity(1),
                            )
                          ],),
                          Expanded(child: 
                            GridView.builder(
                              padding: EdgeInsets.all(5),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 25),
                              itemCount: storedItems.items.length,
                              itemBuilder: (context, index) => ItemTile(context, index, storedItems.items[index])
                            ),
                            )
                      ],
                    )              
                )),
    );
  }
}

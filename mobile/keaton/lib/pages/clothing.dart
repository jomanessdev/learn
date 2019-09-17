import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddItemsPage.routeName);
          },
          child: Icon(Icons.add),
        ),
        drawer: MainDrawer(),
        body: FutureBuilder(
          future: Provider.of<StoredItems>(context, listen: false).fetchItemsAndSet(Constants.CLOTHING_TABLE),
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator()) :
          Consumer<StoredItems>(
          child: Center(
            child: Text('No clothes yet.'),
          ),
          builder: (context, storedItems, child) =>
              storedItems.items.length <= 0
                  ? child
                  : ListView.builder(
                      itemCount: storedItems.items.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(storedItems.items[index].image),
                        ),
                        title: Text(storedItems.items[index].name),
                        onTap: (){
                          Navigator.of(context).pushNamed(ViewItemPage.routeName, arguments: storedItems.items[index].id);
                        },
                      ),
                    ),
        )));
  }
}

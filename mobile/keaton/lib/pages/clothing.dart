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
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            Navigator.pushNamed(context, AddItemsPage.routeName);
          }),
          tooltip: 'Add New Item',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // drawer: MainDrawer(),
        body: Stack(children: <Widget>[
          DecoratedBox(
            child: FutureBuilder(
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
                            : ListView.builder(
                                itemCount: storedItems.items.length,
                                itemBuilder: (context, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                        storedItems.items[index].image),
                                  ),
                                  title: Text(storedItems.items[index].name),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ViewItemPage.routeName,
                                        arguments: storedItems.items[index].id);
                                  },
                                ),
                              ),
                      )),
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
                title: Text(widget.title),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
            ),
          )
        ]));
  }
}

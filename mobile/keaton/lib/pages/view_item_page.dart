import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/providers/stored_items.dart';
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
        title: Text(selectedItem.name),
      ),
      body: Column(children: <Widget>[
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(selectedItem.image, fit: BoxFit.cover,width: double.infinity),
        ),
        SizedBox(height: 10,),
        Text(selectedItem.description, textAlign: TextAlign.center,),
      ]),
    );
  }
}

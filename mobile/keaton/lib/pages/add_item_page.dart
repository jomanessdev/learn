import 'dart:io';
import 'package:keaton/widgets/wizard/add_wizard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/widgets/image/image_input.dart';
import 'package:keaton/providers/stored_items.dart';

class AddItemsPage extends StatefulWidget {
  static const routeName = 'add-item';
  @override
  State<StatefulWidget> createState() {
    return _AddItemsPageState();
  }
}

class _AddItemsPageState extends State<AddItemsPage> {
  final _titleController = TextEditingController();
  File _pickedImage;
  int calledAlready = 0;

  void _saveItem() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      //todo show error
      return;
    }
    Provider.of<StoredItems>(context, listen: false)
        .addItem(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  void _showModalBottomSheet(BuildContext ctx) {
    this.calledAlready++;

    if (calledAlready > 1) {
      return;
    }

    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return Container(
            height: 300,
            child: AddWizard()
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showModalBottomSheet(context));

    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Closet'),
      ),
      body: Container(
        //TODO add take again graphic
        child: Column(children: <Widget>[
          // RaisedButton(
          //   onPressed: () {
          //     _showModalBottomSheet(context);
          //   },
          // ),
          Expanded(child: ImageInput(ModalRoute.of(context).settings.arguments))
        ]),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

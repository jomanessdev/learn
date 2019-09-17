import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/widgets/drawer/main_drawer.dart';
import 'package:keaton/widgets/image/image_input.dart';
import 'package:keaton/providers/stored_items.dart';

class AddItemsPage extends StatefulWidget{
  static const routeName = 'add-item';

  @override
  State<StatefulWidget> createState() {
    return _AddItemsPageState();
  }
}

class _AddItemsPageState extends State<AddItemsPage>{

  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _saveItem(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      //todo show error
      return;
    }
    Provider.of<StoredItems>(context, listen: false).addItem(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10,),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: _saveItem,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
          ],
        ),
      ),
    );}
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/models/clothing_item.dart';
import 'package:keaton/pages/view_item_page.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:keaton/widgets/color/color_picker.dart';
import 'package:keaton/widgets/image/image_input.dart';
import 'package:keaton/widgets/season/season_picker.dart';
import 'package:keaton/widgets/type_picker/type_picker.dart';
import 'package:provider/provider.dart';

class AddItemsPage extends StatefulWidget {
  static const routeName = 'add-item';

  @override
  State<StatefulWidget> createState() {
    return _AddItemsPageState();
  }
}

class _AddItemsPageState extends State<AddItemsPage> {
  final _titleController = TextEditingController();
  final _brandNameController = TextEditingController();
  final _itemSizeController = TextEditingController();

  bool titleValid = true;
  bool brandValid = true;
  bool sizeValid = true; 
  bool typeValid = true;

  File selectedImage;
  String selectedColor;
  String selectedSeason;
  String selectedType;

  void setColorCallback(String _color) {
    setState(() {
      this.selectedColor = _color;
    });
  }

  void setSeasonCallback(String _season) {
    setState(() {
      this.selectedSeason = _season;
    });
  }

  void setTypeCallback(String _type){
    setState(() {
      this.selectedType = _type;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openWizard(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    this.selectedImage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(child: ImageInput(this.selectedImage))
        ]),
        padding: EdgeInsets.all(10),
      ),
    );
  }

  void _openWizard(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("What's the name of this item?"),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Title',
                          errorText: titleValid
                              ? null
                              : 'Please enter a name for this item.'),
                      controller: _titleController,
                    )),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      child: Text('Next'),
                      onPressed: () {
                        if (this._titleController.text != null &&
                            this._titleController.text.isNotEmpty) {
                          setState(() {
                            titleValid = true;
                          });
                          Navigator.of(context).pop();
                          this._openColorWizard();
                        } else {
                          setState(() {
                            titleValid = false;
                          });
                        }
                      },
                    )
                  ],
                )
              ],
            ));
  }

  void _openColorWizard() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("What color is this item?"),
              children: <Widget>[
                Container(
                  width: 400,
                  height: 100,
                  child: ColorPicker(this.setColorCallback),
                  padding: EdgeInsets.all(5),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _openWizard(context);
                      },
                    ),
                    RaisedButton(
                      child: Text('Next'),
                      onPressed: () {
                        if(this.selectedColor != null){
                        Navigator.of(context).pop();
                        _openBrandWizard();
                        }
                      },
                    )
                  ],
                )
              ],
            ));
  }

  void _openBrandWizard() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("What's the name brand of this item?"),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Brand',
                          errorText: brandValid
                              ? null
                              : 'Please enter the brand name for this item.'),
                      controller: _brandNameController,
                    )),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        this._openColorWizard();
                      },
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Next'),
                      onPressed: () {
                        if (this._brandNameController.text != null &&
                            this._brandNameController.text.isNotEmpty) {
                          setState(() {
                            brandValid = true;
                          });
                          Navigator.of(context).pop();
                          this._openSeasonWizard();
                        } else {
                          setState(() {
                            brandValid = false;
                          });
                        }
                      },
                    )
                  ],
                )
              ],
            ));
  }

   void _openSeasonWizard() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("When season would you wear this item?"),
              children: <Widget>[
                Container(
                  width: 400,
                  height: 100,
                  child: SeasonPicker(this.setSeasonCallback),
                  padding: EdgeInsets.all(5),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _openBrandWizard();
                      },
                    ),
                    RaisedButton(
                      child: Text('Next'),
                      onPressed: () {
                        if(this.selectedSeason != null && this.selectedSeason.isNotEmpty){
                          Navigator.of(context).pop();
                          this._openSizeWizard();
                        }
                      },
                    )
                  ],
                )
              ],
            ));
  }

  void _openSizeWizard() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("What size is this item?"),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Size (ex. M, medium, 5)',
                          errorText: sizeValid
                              ? null
                              : 'Please enter the size of this item.'),
                      controller: _itemSizeController,
                    )),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.of(context).pop();
                            this._openSeasonWizard();                      
                      },
                    ),
                    RaisedButton(
                      child: Text('Next'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        if(this._itemSizeController.text != null && this._itemSizeController.text.isNotEmpty){
                          Navigator.of(context).pop();
                          this._openTypeWizard();
                        }
                      },
                    )
                  ],
                )
              ],
            ));
  }

  void _openTypeWizard() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("What is this item?"),
              children: <Widget>[
                Container(
                    height: 200,
                    width: 400,
                    padding: EdgeInsets.all(5),
                    child: TypePicker(this.setTypeCallback),
                ),                  
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.of(context).pop();
                            this._openSeasonWizard();                      
                      },
                    ),
                    RaisedButton(
                      child: Text('Submit'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        if(
                          this._titleController.text.isNotEmpty 
                          && this._titleController.text != null 
                          && this._brandNameController.text.isNotEmpty 
                          && this._brandNameController.text != null 
                          && this._itemSizeController.text.isNotEmpty 
                          && this._itemSizeController.text != null
                          && this.selectedColor.isNotEmpty
                          && this.selectedColor != null
                          && this.selectedSeason.isNotEmpty
                          && this.selectedSeason != null
                          && this.selectedImage != null
                          && this.selectedType != null
                          && this.selectedType.isNotEmpty
                        ){
                            ClothingItem _newClothingItem = new ClothingItem(
                              id: DateTime.now().toString()+this._titleController.text,
                              description: '',
                              selectedImage: this.selectedImage,
                              name: this._titleController.text,
                              colorName: this.selectedColor,
                              brand: this._brandNameController.text,
                              season: this.selectedSeason,
                              size: this._itemSizeController.text,
                              createdDate: DateTime.now().toString(),
                              lastWornDate: DateTime.now().toString(),
                              purchasedDate: DateTime.now().toString(),
                              timesWorn: '0',
                              type: this.selectedType
                            );
                            Provider.of<StoredItems>(context, listen: false).addItem(_newClothingItem);
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacementNamed(
                                        ViewItemPage.routeName,
                                        arguments: _newClothingItem.id);
                          }
                      },
                    )
                  ],
                )
              ],
            ));
  }


  

}

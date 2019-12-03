import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/constants/constants.dart';

class TypePicker extends StatefulWidget {

  Function _setTypeCallback;

  TypePicker(this._setTypeCallback);

  @override
  State<StatefulWidget> createState() {
    return TypePickerState();
  }
}

class TypePickerState extends State<TypePicker> {
  String selectedType;

  void _setType(String type) {
    setState(() {
      this.selectedType = type;
      widget._setTypeCallback(this.selectedType);
    });
}

  @override
  Widget build(BuildContext context) {
    return 
        Container(           
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Long Sleeve Shirt'),
              leading: Radio(
                value: Constants.LONG_SHIRT,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Short Sleeve Shirt'),
              leading: Radio(
                value: Constants.SHORT_SHIRT,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Pants'),
              leading: Radio(
                value: Constants.PANTS,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Shorts'),
              leading: Radio(
                value: Constants.SHORTS,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Dress'),
              leading: Radio(
                value: Constants.DRESS,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Suit'),
              leading: Radio(
                value: Constants.SUIT,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Shoes'),
              leading: Radio(
                value: Constants.SHOES,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            ),
            ListTile(
              title: Text('Accesories'),
              leading: Radio(
                value: Constants.ACCESSORIES,
                groupValue: this.selectedType,
                onChanged: (String _type){
                  this._setType(_type);
                },
              ),
            )
          ],
        )
      )
    );
  }
}
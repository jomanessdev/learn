import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keaton/constants/constants.dart';

class AddText extends StatelessWidget {
  final String palceHolderText;

  AddText({this.palceHolderText});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText:
              this.palceHolderText.isNotEmpty && this.palceHolderText != null
                  ? this.palceHolderText
                  : '',
        ),
      ),
      RaisedButton(
        child: Text(Constants.BUTTON_TEXT_DONE),
        onPressed: () {},
      )
    ]);
  }
}

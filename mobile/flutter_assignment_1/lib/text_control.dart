import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment_1/text_wid.dart';

class TextControl extends StatefulWidget {
  final String _input;

  TextControl(this._input);

  @override
  State<StatefulWidget> createState() {
    print('Create TextCOntrol state called');
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _val = '';

  void initState() {
    _val = widget._input;
    print('initState called: $_val');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build TextControl called');
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Change Text'),
          onPressed: () {
            setState(() {
              setState(() {
                int randomNumber = Random().nextInt(3);
                print('Update text SWITCH: $randomNumber .');
                switch (randomNumber) {
                  case 0:
                    _val = 'This is case 0';
                    break;
                  case 1:
                    _val = 'This is case 1';
                    break;
                  case 2:
                    _val = 'This is case 2';
                    break;
                  default:
                    _val = 'This is the default case';
                }
              });
            });
          },
        ),
        TextWid(_val)
      ],
    );
  }
}

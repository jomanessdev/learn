import 'package:flutter/cupertino.dart';

class TextWid extends StatelessWidget{
  final String _input;
  TextWid(this._input);

  @override
  Widget build(BuildContext context) {
    print('Build TextWid called');
    return Text(_input);
  }
}
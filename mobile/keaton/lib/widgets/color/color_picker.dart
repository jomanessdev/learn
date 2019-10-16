import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/constants/constants.dart';

class ColorPicker extends StatefulWidget {

  Function _setColorCallback;

  ColorPicker(this._setColorCallback);

  @override
  State<StatefulWidget> createState() {
    return ColorPickerState();
  }
}

class ColorPickerState extends State<ColorPicker> {
  String selectedColor;
  Color highLightColor = Colors.yellow;
  double circleSize = 30;

  void _setColor(String color) {
    setState(() {
      this.selectedColor = color;
      widget._setColorCallback(this.selectedColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.green, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.GREEN)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.GREEN);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.blue, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.BLUE)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.BLUE);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.red, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.RED)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.RED);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.pink, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.PINK)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.PINK);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.orange, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.ORANGE)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.ORANGE);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.purple, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.PURPLE)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.PURPLE);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.black, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.BLACK)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.BLACK);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.grey, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.GREY)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.GREY);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.brown, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.BROWN)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.BROWN);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_1, color: Colors.yellow, size: this.circleSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.YELLOW)
                  ? Colors.grey
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setColor(Constants.YELLOW);
              });
            },
          ),
        ],
    ));
  }
}

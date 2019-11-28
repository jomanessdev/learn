import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/helpers/color_icon_helper.dart';

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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.GREEN, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.GREEN)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.BLUE, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.BLUE)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.RED, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.RED)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.PINK, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.PINK)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.ORANGE, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.ORANGE)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.PURPLE, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.PURPLE)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.BLACK, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.BLACK)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.GREY, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.GREY)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.BROWN, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.BROWN)
                  ? Theme.of(context).highlightColor
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
              child: ColorIconHelper.giveMeTheColorIcon(Constants.YELLOW, this.circleSize),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedColor == Constants.YELLOW)
                  ? Theme.of(context).highlightColor
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

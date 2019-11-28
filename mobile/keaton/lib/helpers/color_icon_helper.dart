import 'package:flutter/material.dart';
import 'package:keaton/constants/constants.dart';

class ColorIconHelper{
  static Icon giveMeTheColorIcon(String color, double circleSize, {double iconOpacity}){
    switch(color){
      case Constants.BLUE:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.blue.withOpacity(iconOpacity) : Colors.blue, size: circleSize,);
        break;
      case Constants.RED:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.red.withOpacity(iconOpacity) :  Colors.red, size: circleSize,);
        break;
      case Constants.GREEN:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.green.withOpacity(iconOpacity) :  Colors.green, size: circleSize,);
        break;
      case Constants.BLACK:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.black.withOpacity(iconOpacity) :  Colors.black, size: circleSize,);
        break;
      case Constants.BROWN:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.brown.withOpacity(iconOpacity) :  Colors.brown, size: circleSize,);
        break;
      case Constants.PURPLE:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.purple.withOpacity(iconOpacity) :  Colors.purple, size: circleSize,);
        break;
      case Constants.PINK:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.pink.withOpacity(iconOpacity) :  Colors.pink, size: circleSize,);
        break;
      case Constants.YELLOW:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.yellow.withOpacity(iconOpacity) :  Colors.yellow, size: circleSize,);
      break;
      case Constants.ORANGE:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.orange.withOpacity(iconOpacity) :  Colors.orange, size: circleSize,);
      break;
      case Constants.GREY:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.grey.withOpacity(iconOpacity) :  Colors.grey, size: circleSize,);
        break;
      case Constants.WHITE:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.white.withOpacity(iconOpacity) :  Colors.white.withOpacity(0.6), size: circleSize,);
        break;
      default:
        return Icon(Icons.radio_button_unchecked, color: Colors.grey.withOpacity(0.6), size: circleSize,);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:keaton/constants/constants.dart';

class TypeIconHelper{
  static Icon giveMeTheTypeIcon(String type, double circleSize, {double iconOpacity}){
    switch(type){
      case Constants.SHORT_SHIRT:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.blue.withOpacity(iconOpacity) : Colors.blue, size: circleSize,);
        break;
      case Constants.LONG_SHIRT:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.red.withOpacity(iconOpacity) :  Colors.red, size: circleSize,);
        break;
      case Constants.PANTS:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.green.withOpacity(iconOpacity) :  Colors.green, size: circleSize,);
        break;
      case Constants.DRESS:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.black.withOpacity(iconOpacity) :  Colors.black, size: circleSize,);
        break;
      case Constants.SUIT:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.brown.withOpacity(iconOpacity) :  Colors.brown, size: circleSize,);
        break;
      case Constants.SHOES:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.purple.withOpacity(iconOpacity) :  Colors.purple, size: circleSize,);
        break;
      case Constants.ACCESSORIES:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.pink.withOpacity(iconOpacity) :  Colors.pink, size: circleSize,);
        break;
      case Constants.SHORTS:
        return Icon(Icons.radio_button_unchecked, color: iconOpacity != null ? Colors.yellow.withOpacity(iconOpacity) :  Colors.yellow, size: circleSize,);
      break;
      default:
        return Icon(Icons.radio_button_unchecked, color: Colors.grey.withOpacity(0.6), size: circleSize,);
    }
  }
}
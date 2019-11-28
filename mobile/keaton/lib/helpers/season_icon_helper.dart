import 'package:flutter/material.dart';
import 'package:keaton/constants/constants.dart';

class SeasonIconHelper{
  static Icon giveMeTheSeasonIcon(String season, { double iconSize, Color color }){
    switch(season){
      case Constants.WINTER:
        return Icon(Icons.ac_unit, color: color !=null ? color: Colors.lightBlue, size: iconSize,);
        break;
      case Constants.SPRING:
        return Icon(Icons.filter_vintage, color:color !=null ? color: Colors.yellow, size: iconSize);
        break;
      case Constants.SUMMER:
        return Icon(Icons.brightness_5, color: color !=null ? color: Colors.orange, size: iconSize);
        break;
      case Constants.FALL:
        return Icon(Icons.spa, color: color !=null ? color: Colors.green, size: iconSize);
        break;
      case Constants.ANY_SEASON:
        return Icon(Icons.all_inclusive, color: color !=null ? color: Colors.green, size: iconSize);
        break;
      default:
        return Icon(Icons.not_interested, size: iconSize);
    }
  }
}
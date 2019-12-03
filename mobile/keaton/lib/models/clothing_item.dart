import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:keaton/models/item_base.dart';

class ClothingItem extends ItemBase{
  String colorName;
  String season;
  String brand;
  String createdDate;
  String lastWornDate;
  String purchasedDate;
  String size;
  String timesWorn;
  String type;
  
  ClothingItem({@required String id, @required String description, @required File selectedImage, @required String name, @required this.colorName , @required this.season
  , @required this.brand, @required this.createdDate, @required this.lastWornDate, @required purchasedDate, @required this.size, @required this.timesWorn, @required this.type}): super(id: id,name: name,image: selectedImage, description: description);
  @override
  String toString() {
    return 'id: ${this.id}, description: ${this.description}, selectedImage: ${this.image.toString()}, name: ${this.name}, colorName: ${this.colorName}, season: ${this.season}, brand: ${this.brand}, size: ${this.size}, timesWorn: ${this.timesWorn} ,createdDate: ${this.createdDate}, lastWornDate: ${this.lastWornDate}, purchasedDate: ${this.purchasedDate}, type${this.type}';
  }
}
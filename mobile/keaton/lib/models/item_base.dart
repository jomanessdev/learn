import 'dart:io';

import 'package:flutter/material.dart';

class ItemBase {
  String id;
  String name;
  String description;
  File image;

  ItemBase({@required this.id, @required this.name, @required this.description,@required this.image});

}
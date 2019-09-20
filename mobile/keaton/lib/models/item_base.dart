import 'dart:io';

import 'package:flutter/material.dart';

class ItemBase {
  final String id;
  final String name;
  final String description;
  final File image;
  final category;
  final String size;

  ItemBase({@required this.id, @required this.name, @required this.description,@required this.image, this.category, this.size});

}
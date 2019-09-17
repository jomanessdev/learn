import 'dart:io';

import 'package:flutter/material.dart';

class ItemBase {
  final String id;
  final String name;
  final String description;
  final File image;

  ItemBase({@required this.id, @required this.name, @required this.description,@required this.image});

}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/models/clothing_item.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/helpers/db_helper.dart';

class StoredItems with ChangeNotifier {
  List<ClothingItem> _items = [];

  List<ClothingItem> get items {
    return [..._items];
  }

  ClothingItem findItemById(String pickedId){
    return _items.firstWhere((item) => item.id == pickedId);
  }

  void addItem(ClothingItem _inputItem) {

    _items.add(_inputItem);

    notifyListeners();
    DBHelper.insert(Constants.CLOTHING_TABLE, {
      'id': _inputItem.id,
      'name': _inputItem.name,
      'description': _inputItem.description,
      'image': _inputItem.image.path,
      'brand': _inputItem.brand,
      'colorName': _inputItem.colorName,
      'purchasedDate': DateTime.now().toString(),
      'createdDate': DateTime.now().toString(),
      'lastWornDate': DateTime.now().toString(),
      'size': _inputItem.size,
      'season': _inputItem.season,
      'timesWorn': _inputItem.timesWorn,
    });
  }

  Future fetchItemsAndSet(String tableName) async{
    final returnedValues = await DBHelper.getData(tableName);

    _items = returnedValues.map((item) => ClothingItem(
      id: item['id'], 
      description: item['description'], 
      selectedImage: File(item['image']), 
      name: item['name'], 
      colorName: item['colorName'], 
      season: item['season'],
      brand: item['brand'], 
      createdDate: item['createdDate'], 
      lastWornDate: item['lastWornDate'], 
      purchasedDate: item['purchasedDate'], 
      size: item['size'], 
      timesWorn: item['timesWorn']
    )).toList();
    print(_items);
    notifyListeners();
  }

  void deleteItem(String tableName, String itemId){
    DBHelper.delete(tableName, itemId);
    fetchItemsAndSet(tableName);
    notifyListeners();
  }
}

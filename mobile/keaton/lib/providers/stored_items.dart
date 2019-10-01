import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:keaton/models/item_base.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/helpers/db_helper.dart';

class StoredItems with ChangeNotifier {
  List<ItemBase> _items = [];

  List<ItemBase> get items {
    return [..._items];
  }

  ItemBase findItemById(String pickedId){
    return _items.firstWhere((item) => item.id == pickedId);
  }

  void addItem(String pickedName, File pickedImage) {
    final newItem = ItemBase(
        id: DateTime.now().toString(),
        name: pickedName,
        description: 'desc',
        image: pickedImage);

    _items.add(newItem);
    notifyListeners();
    DBHelper.insert(Constants.CLOTHING_TABLE, {
      'id': newItem.id,
      'name': newItem.name,
      'description': newItem.description,
      'image': newItem.image.path
    });
  }

  Future fetchItemsAndSet(String tableName) async{
    final returnedValues = await DBHelper.getData(tableName);
    _items = returnedValues.map((item) => ItemBase(id: item['id'], name: item['name'], description: item['description'],image: File(item['image']))).toList();
    notifyListeners();
  }

  void deleteItem(String tableName, String itemId){
    DBHelper.delete(tableName, itemId);
    fetchItemsAndSet(tableName);
    notifyListeners();
  }
}

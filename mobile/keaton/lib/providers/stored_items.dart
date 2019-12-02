import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/models/clothing_item.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/helpers/db_helper.dart';
import 'package:keaton/models/filter_meta.dart';

class StoredItems with ChangeNotifier {
  List<ClothingItem> _items = [];
  Set<FilterMeta> filters = new Set<FilterMeta>();
  List<String> _brands = [];
  List<String> _colors = [];
  List<String> _sizes = [];


  List<ClothingItem> get items {
    return [..._items];
  }

  List<String> get brands{
    return [..._brands];
  }

   List<String> get colors{
    return [..._colors];
  }

   List<String> get sizes{
    return [..._sizes];
  }

  void updateFilterValue(String columnName, String filterValue){
    FilterMeta _filterMeta = this.filters.firstWhere((_filterMeta) => _filterMeta.columnName == columnName, orElse: () => null);

    if(_filterMeta == null){
      _filterMeta = new FilterMeta(columnName, [filterValue]);
      this.filters.add(_filterMeta);
    }else{
      _filterMeta.selectedFilterValues.add(filterValue);
    }
    print('done adding filter: ${filters.length}');
    filters.forEach((f) => {
      print('${f.columnName}: ${f.selectedFilterValues.length}')
    });
  }

  void removeFilterValue(String columnName, String filterValue){
    this.filters.firstWhere((_filterMeta) => _filterMeta.columnName == columnName).selectedFilterValues.remove(filterValue);
    print('done removing filter: ${filters.length}');
    filters.forEach((f) => {
      print('${f.columnName}: ${f.selectedFilterValues.length}')
    });
  }


  void addNewFilters(Set<FilterMeta> _filters){
    _filters.forEach((filter) => {
      this.filters.add(filter)
    });
    print('done adding filters');
  }

  void removeFilters(Set<FilterMeta> _filters){
    _filters.forEach((filter) => {
      this.filters.remove(filter)
    });
    print('done removing filters');
  }

  bool checkIfFilterValueExists(String columnName, String value){
    bool result = false;
    FilterMeta _filterMeta = this.filters.firstWhere((_filterMeta) => _filterMeta.columnName == columnName, orElse: () => null);

    if(_filterMeta == null) return result;

    return _filterMeta.selectedFilterValues.contains(value);
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
    notifyListeners();
  }

  void deleteItem(String tableName, String itemId){
    DBHelper.delete(tableName, itemId);
    fetchItemsAndSet(tableName);
    notifyListeners();
  }

  Future fetchAllBrands(String tableName) async{
    final returnedValues = await DBHelper.getAllBrands();
    _brands = [];
    returnedValues.forEach((item) => {
      _brands.add(item['brand'])
    });
    notifyListeners();
  }

  Future fetchAllColors(String tableName) async{
    final returnedValues = await DBHelper.getAllColors();
    _colors = [];
    returnedValues.forEach((item) => {
      _colors.add(item['colorName'])
    });
    notifyListeners();
  }

  Future fetchAllSizes(String tableName) async{
    final returnedValues = await DBHelper.getAllSizes();
    _sizes = [];
    returnedValues.forEach((item) => {
      _sizes.add(item['size'])
    });
    notifyListeners();
  }

  Future updateFilterAndFetchResults(String tableName) async{

    bool allFiltersAreEmpty = true;
    FilterMeta _filterMeta = this.filters.firstWhere((_filter) => _filter.selectedFilterValues.length > 0,orElse: () => null);

    if(_filterMeta != null ) {
      print('not all filters are empty');
      allFiltersAreEmpty = false ;
    }

    if(allFiltersAreEmpty){
      print('all filters are empty...RESETING list');
      this.fetchItemsAndSet(tableName);
    }

    else{
      String _queryStatement = 'SELECT * from ${tableName} WHERE';

      for(int j = 0; j < filters.length; j++){
        if(filters.elementAt(j).selectedFilterValues.length < 1){}
        else{
          _queryStatement += ' ${filters.elementAt(j).columnName} IN (${this.getCommaSepartedValues(filters.elementAt(j).selectedFilterValues)})';
          if(filters.length > 1 &&  j!=filters.length-1 && filters.elementAt(j+1).selectedFilterValues.length > 0){
            _queryStatement += ' AND';
          }
        }
      }

    print(_queryStatement);
    final returnedValues = await DBHelper.customQuery(_queryStatement);

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
    notifyListeners();
    }
  }

  String getCommaSepartedValues(List<String> values){
    String result = '';
    for(int i = 0; i < values.length; i++){
      result+= i==values.length - 1  ? '\'${values[i]}\'' : '\'${values[i]}\',';
    }
    return result;
  }

}

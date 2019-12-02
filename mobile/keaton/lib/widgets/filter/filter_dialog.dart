import 'package:flutter/material.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/models/filter_meta.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:provider/provider.dart';

import 'filter_list.dart';

class FilterDialog{

  String filterType;
  String dialogFilterTitle;
  Set<FilterMeta> selectedFilterValues = new Set();
  
  FilterDialog(this.filterType);
  
  void openFilterWizard(BuildContext context){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("Select Brand(s)"),
              children: <Widget>[
                Container(
                  child: FutureBuilder(
      future: Provider.of<StoredItems>(context, listen: false).fetchAllBrands(Constants.CLOTHING_TABLE),
      builder: (context, snapshot) => 
        snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator()) 
        : Consumer<StoredItems>(
            child: Center(child: Text('Could not load any brands'),),
            builder: (context, storedItems, child) => storedItems.brands.length <= 0
            ? child : Container(
                        width: 400,
                        height: 200,
                        child:
                          FilterList(Constants.BRAND_COLUMN_NAME, storedItems.brands, ()=>{
                          })
                      )
                    )
                  )
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      child: Text('Set'),
                      onPressed: () {
                        Provider.of<StoredItems>(context).updateFilterAndFetchResults(Constants.CLOTHING_TABLE);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ));
  }
  
}
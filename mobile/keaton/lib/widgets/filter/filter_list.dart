import 'package:flutter/material.dart';
import 'package:keaton/models/filter_meta.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:provider/provider.dart';
class FilterList extends StatefulWidget{
  final String tableColumnName;
  final List<String> availableFilterValues;
  final VoidCallback onFilterUpdated;

  FilterList(this.tableColumnName,this.availableFilterValues,this.onFilterUpdated);

  @override
  createState() => FilterListState();
}

class FilterListState extends State<FilterList>{

  Set<FilterMeta> selectedFilters = new Set();

  filterUpdated(){
    widget.onFilterUpdated();
  }

  @override
  Widget build(BuildContext context){ 
    
    return ListView.builder(
      itemCount: widget.availableFilterValues.length,
      itemBuilder: (BuildContext context, int index) => CheckboxListTile(
        title: Text(widget.availableFilterValues[index]), 
        onChanged: (bool value) {
          if(value){
              setState(() {
                // selectedFilters.add(new FilterMeta(widget.tableColumnName, widget.availableFilterValues[index]));
                Provider.of<StoredItems>(context).updateFilterValue(widget.tableColumnName, widget.availableFilterValues[index]);
              }); 
              this.filterUpdated();
          }else{
            setState(() {
              // selectedFilters.remove(new FilterMeta(widget.tableColumnName, widget.availableFilterValues[index]));
              Provider.of<StoredItems>(context).removeFilterValue(widget.tableColumnName, widget.availableFilterValues[index]);
            }); 
            this.filterUpdated();
          }
        }, 
        // value: selectedFilters.contains(widget.availableFilterValues[index]),
        value: Provider.of<StoredItems>(context).checkIfFilterValueExists(widget.tableColumnName,widget.availableFilterValues[index])
      ),
    );
  }
}
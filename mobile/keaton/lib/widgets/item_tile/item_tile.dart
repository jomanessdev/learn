import 'package:flutter/material.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/helpers/color_icon_helper.dart';
import 'package:keaton/helpers/season_icon_helper.dart';
import 'package:keaton/models/clothing_item.dart';
import 'package:keaton/pages/view_item_page.dart';
import 'package:keaton/providers/stored_items.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatefulWidget{
  BuildContext context;
  int index;
  ClothingItem item;

  ItemTile(this.context,this.index, this.item);
  
  @override
  State<StatefulWidget> createState() => ItemTileState();

}

class ItemTileState extends State<ItemTile> with SingleTickerProviderStateMixin{

  double _scale;
	AnimationController _controller;

   @override
    void initState() {
      super.initState();
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
        lowerBound: 0.0,
        upperBound: 0.1,
      )
      ..addListener(() { setState(() {});});
    }
    
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    void _onTapDown(TapDownDetails details) {
      _controller.forward();
    }

    void _onTapUp(TapUpDetails details) {
      _controller.reverse();
    }
  
  Future<void> _openDeletePrompt(String itemId) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Would you like to permanately delete this item? '),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text('No'),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                color: Colors.white,
                child: Text('Yes'),
                onPressed: () {
                  //Todo remove hardcoded
                  Provider.of<StoredItems>(context, listen: false)
                      .deleteItem(Constants.CLOTHING_TABLE, itemId);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

  String giveMeSize(String input){
      if(input == null || input.isEmpty){
        return "?";
      }

      if(input.length == 1){
        return input.toUpperCase();
      }

      if(input.length == 2){
        return input.toUpperCase();
      }

      if(input.length >= 3){
        String t1 = input[0];
        String t2 = input[1];
        String t3 = input[2];

        if(double.tryParse(t1) !=null && double.tryParse(t2) != null && t3 == '.'){ 
          if(input.length >=4) return input.substring(0,4);
          return t1+t2; 
        } 
        if(double.tryParse(t1) !=null && double.tryParse(t2) != null) return t1+t2; //return waist part of size
        if(t1.toLowerCase() == 'x' && t2.toLowerCase() != 'x') return t1.toUpperCase() + t2.toUpperCase();
        if(t1.toLowerCase() == 'x' && t2.toLowerCase() == 'x') return input.toLowerCase().allMatches('x').length.toString() + 'X'; //return 2X or 3X or 4X etc..
        if(input.toLowerCase().contains('small')) return 'S';
        if(input.toLowerCase().contains('medium')) return 'M';
        if(input.toLowerCase().contains('large')) return 'L';

        return input.substring(0,2).toUpperCase();
      }
    }

  Widget get _itemTile => AnimatedContainer(
    // padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 1, spreadRadius:1, offset: Offset.fromDirection(120))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(5))),
    child: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            child: 
              Expanded( child: 
                Image(
                  image: FileImage(
                      widget.item.image),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                )
              )
        ),
      Container( 
        padding: EdgeInsets.all(5),
        child: Column(children: <Widget>[                                              
              Container(height: 30, width: double.infinity, child: Container(child:Text(widget.item.name, textScaleFactor: 1.5, overflow: TextOverflow.ellipsis,))),
              Row(                                        
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                  child: Container(
                    child: Text(widget.item.brand, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey),)
                  ),
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Container(
                  child: SeasonIconHelper.giveMeTheSeasonIcon(widget.item.season, iconSize: 24, color: Colors.grey.withOpacity(0.6)),
                ),
                Container(
                  child: ColorIconHelper.giveMeTheColorIcon(widget.item.colorName, 24, iconOpacity: 0.6)
                ),
                Container(
                  width: 40, // TODO MEDIA QUERY
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.6)),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Text(giveMeSize(widget.item.size), textAlign: TextAlign.center),
                    alignment: Alignment.center,
                  )
                ) ])
              ])
            ])),
    ]), duration: Duration(seconds: 1),);
  
  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
     
    return GestureDetector(
      onLongPress: () {
        _openDeletePrompt(
            widget.item.id);
      },
      onTap: () {
        Navigator.of(context).pushReplacementNamed(
            ViewItemPage.routeName,
            arguments: widget.item.id);
      },
      child: _itemTile
    );
  }
  
}
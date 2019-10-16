import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/constants/constants.dart';

class SeasonPicker extends StatefulWidget {

  Function _setSeasonCallback;

  SeasonPicker(this._setSeasonCallback);

  @override
  State<StatefulWidget> createState() {
    return SeasonPickerState();
  }
}

class SeasonPickerState extends State<SeasonPicker> {
  String selectedSeason;
  Color highLightColor = Colors.blueGrey;
  double iconSize = 24;

  void _setSeason(String season) {
    setState(() {
      this.selectedSeason = season;
      widget._setSeasonCallback(this.selectedSeason);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      GridView.count(
        children: <Widget>[
          GestureDetector(
            child: Ink(
              child: Icon(Icons.ac_unit, color: Colors.lightBlue, size: this.iconSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.WINTER)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setSeason(Constants.WINTER);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.filter_vintage
              , color: Colors.green, size: this.iconSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.SPRING)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setSeason(Constants.SPRING);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.brightness_5, color: Colors.yellow, size: this.iconSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.SUMMER)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setSeason(Constants.SUMMER);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: Icon(Icons.terrain, color: Colors.green, size: this.iconSize,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.FALL)
                  ? this.highLightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setSeason(Constants.FALL);
              });
            },
          ),
        ], crossAxisCount: 2,
    );
  }
}

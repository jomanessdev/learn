import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/constants/constants.dart';
import 'package:keaton/helpers/season_icon_helper.dart';

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
              child: SeasonIconHelper.giveMeTheSeasonIcon(Constants.WINTER),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.WINTER)
                  ? Theme.of(context).highlightColor
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
              child: SeasonIconHelper.giveMeTheSeasonIcon(Constants.SPRING),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.SPRING)
                  ? Theme.of(context).highlightColor
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
              child: SeasonIconHelper.giveMeTheSeasonIcon(Constants.SUMMER),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.SUMMER)
                  ? Theme.of(context).highlightColor
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
              child: SeasonIconHelper.giveMeTheSeasonIcon(Constants.FALL),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.FALL)
                  ? Theme.of(context).highlightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setSeason(Constants.FALL);
              });
            },
          ),
          GestureDetector(
            child: Ink(
              child: SeasonIconHelper.giveMeTheSeasonIcon(Constants.ANY_SEASON),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (this.selectedSeason == Constants.ANY_SEASON)
                  ? Theme.of(context).highlightColor
                  : null,
              ),
            ),
            onTap: () {
              setState(() {
                this._setSeason(Constants.ANY_SEASON);
              });
            },
          )
        ], crossAxisCount: 2,
    );
  }
}

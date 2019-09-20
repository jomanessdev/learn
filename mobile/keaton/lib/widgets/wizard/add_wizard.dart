import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keaton/widgets/wizard/add_text.dart';
import 'package:keaton/widgets/wizard/select_category.dart';

class AddWizard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddWizardState();
  }
}

class _AddWizardState extends State<AddWizard>{
  final int currentStep = 0;

  Map<String,Widget> steps = {
    'What category does this item fit in?': SelectCategory(),
    'What color is this item?':AddText(),
    'What size is this item?':AddText(),
    'What is the name of this item?':AddText()
  };

  Widget _getStepsWidget(){
    return steps.values.elementAt(this.currentStep);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(steps.keys.elementAt(this.currentStep)),
        _getStepsWidget()
      ],
    );
  }
}
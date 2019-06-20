import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  Map<String, String> productHolder;

  ProductDetails(this.productHolder);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        print('Back Button Pressed');
        Navigator.pop(context, false);
        return Future.value(false); // you are allowed to leave //set to false to ignore original opo request and go with custom one above
      },
        child: Scaffold(
            appBar: AppBar(
              title: Text(this.productHolder['title']),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(this.productHolder['imageUrl']),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text('Some Details'),
                    )),
                RaisedButton(
                  child: Text('Delete'),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            )));
  }
}

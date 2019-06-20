import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: addProduct({
        'title': 'Chocolate',
        'imageUrl':'assets/ncat_union.jpeg'
      }),
      child: Text('Add Product'),
    );
  }
}

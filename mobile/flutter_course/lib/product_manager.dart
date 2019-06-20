import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/products.dart';

class ProductManager extends StatefulWidget {
  final Map<String,String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String,String>> _products = [];

  @override
  void initState() {
    if(widget.startingProduct != null){
    _products.add(widget.startingProduct);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManagerState] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String,String> product){
    setState(() {
     _products.add(product); 
    });
    print(_products);
  }

  void _deleteProduct(int index){
    setState(() {
     _products.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _products.add({'title':'SomeTitle','imageUrl':'assets/ncat_union.jpeg'});
            });
          },
          child: Text('Add Product'),
        ),
      ),
      Expanded(child: Products(_products, deleteProduct: _deleteProduct),)
    ]);
  }
}

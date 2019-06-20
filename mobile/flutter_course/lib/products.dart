import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/productDetails_page.dart';

class Products extends StatelessWidget {
  
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(products[index]['imageUrl']),
        Text(products[index]['title']),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Product Details'),
              onPressed: () => {
                    Navigator.push<bool>(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ProductDetails(products[index]);
                    })).then((bool value) {
                      if(value) deleteProduct(index);
                    })
                  },
            )
          ],
        ),
      ],
    ));
  }

  Widget _buildProductList() {
    Widget productCards = Center(
      child: (Text('No products found, please add some')),
    );

    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}

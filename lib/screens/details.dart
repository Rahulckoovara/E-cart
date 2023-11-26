import 'package:e_cart/models/product_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  //final ProductModel product;
  const Details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Details'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            //Image.network(product.image),
          ],
        ));
  }
}

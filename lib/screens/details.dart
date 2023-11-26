import 'package:e_cart/models/product_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final ProductModel product;
  const Details({
    super.key,
    required this.product,
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
            Container(
                width: 200, height: 200, child: Image.network(product.image)),
          ],
        ));
  }
}

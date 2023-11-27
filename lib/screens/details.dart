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
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 214, 220, 224)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                      ))),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(7),
            width: double.infinity,
            height: 420,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 238, 238),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          product.title.toUpperCase(),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '₹' + product.price.toString(),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(product.description)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹' '${product.price}',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.send),
                label: Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}

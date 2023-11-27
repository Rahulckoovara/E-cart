import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_cart/constants/constant.dart';
import 'package:e_cart/models/product_model.dart';
import 'package:e_cart/screens/details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> _getProduct() async {
    var url = Uri.parse(kProductURL);
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    print('data $data');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
              items: [
                Image.asset('assets/ad1.png'),
                Image.asset('assets/ad2.png'),
              ],
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                viewportFraction: 1,
              )),
          Expanded(
            child: FutureBuilder<List>(
                future: _getProduct(),
                builder: (context, snapshot) {
                  //-----------------internet connection-----------------------------

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error Occured'),
                    );
                  }
                  if (snapshot.data == null) {
                    return Center(child: Text('No data'));
                  }
                  if (snapshot.data!.isEmpty) {
                    return Center(child: Text('empty'));
                  }
                  return GridView.builder(
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    product: ProductModel(
                                        id: product['id'],
                                        title: product['title'],
                                        description: product['description'],
                                        price: product['price'].toDouble(),
                                        category: product['category'],
                                        image: product['image']
                                        // rating:
                                        //     product['rating']['rate'].toDouble(),
                                        //   "count": product['rating']['count'],
                                        // },
                                        ),
                                  )),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  product['image'],
                                  width: 80,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${product['title']}",
                                  maxLines: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(product['price'].toString()),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.favorite_outline_outlined)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:e_cart/screens/cart.dart';
// import 'package:e_cart/screens/favourite.dart';
// import 'package:flutter/material.dart';
// import 'package:e_cart/constants/constant.dart';
// import 'package:http/http.dart' as http;
// import 'package:e_cart/screens/profile.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // @override
//   // void initState() {
//   //   _getProduct();
//   //   super.initState();
//   // }
//   Future<List> _getProduct() async {
//     var url = Uri.parse(kProductURL);
//     final response = await http.get(url);
//     final data = jsonDecode(response.body);

//     print('data $data');
//     return data;
//   }

//   int currentIndex = 0;

//   List screens = [const Profile(), const Favourite(), const Cart()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Flipkart',
//           style: TextStyle(color: Colors.white),
//         ),
//         // actions: [
//         //   Container(
//         //     child: Expanded(
//         //       child: Padding(
//         //         padding: const EdgeInsets.fromLTRB(1.5, 25, 1.5, 0),
//         //         child: TextField(
//         //           decoration: InputDecoration(
//         //             filled: true,
//         //             fillColor: Colors.white,
//         //             border: OutlineInputBorder(
//         //               borderRadius: BorderRadius.circular(2),
//         //             ),
//         //             hintText: 'type something',
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   )
//         // ],
//         backgroundColor: Colors.blue,
//         toolbarHeight: 60,
//       ),
//       body: FutureBuilder<List>(
//           future: _getProduct(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             // if (snapshot.hasError) {
//             //   return Center(
//             //     child: Text('Error Occured'),
//             //   );
//             // }
//             if (snapshot.data == null) {
//               return Center(child: Text('No data'));
//             }
//             if (snapshot.data!.isEmpty) {
//               return Center(child: Text('empty'));
//             }
//             return GridView.builder(
//               itemBuilder: (context, index) {
//                 final product = snapshot.data![index];
//                 return Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.network(
//                           product['image'],
//                           width: 100,
//                           height: 100,
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "${product['title']}",
//                           maxLines: 2,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(product['price'].toString()),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.favorite_outline_outlined)),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               itemCount: snapshot.data!.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
//             );
//           }
//           ),
//     );
//   }
// }
//       // bottomNavigationBar: BottomNavigationBar(
//       //   currentIndex: currentIndex,
//       //   items: [
//       //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.favorite), label: 'Favorites'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.shopping_cart), label: 'Cart')
//       //   ],
//       //   selectedIconTheme: IconThemeData(color: Colors.blue),
//       //   unselectedLabelStyle: TextStyle(
//       //       color: Colors.grey), // Change the color of the selected icon
//       //   unselectedIconTheme: IconThemeData(color: Colors.grey),
//       // ),
// //     );
// //   }
// // }

// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);
// //   @override
// //   _HomeState createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   late Future<List> _productFuture;
// //   void initState() {
// //     super.initState();
// //     _productFuture = _getProduct();
// //   }

//   // Future<List> _getProduct() async {
//   //   var url = Uri.parse(kProductURL);
//   //   final response = await http.get(url);
//   //   final data = jsonDecode(response.body);

//   //   print('data $data');
//   //   return data;
//   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return
// // FutureBuilder<List>(
// //       future: _productFuture,
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         }
// //         // if (snapshot.hasError) {
// //         //   return Center(
// //         //     child: Text('Error Occured'),
// //         //   );
// //         // }
// //         if (snapshot.data == null) {
// //           return Center(child: Text('No data'));
// //         }
// //         if (snapshot.data!.isEmpty) {
// //           return Center(child: Text('empty'));
// //         }
// //         return GridView.builder(
// //           itemBuilder: (context, index) {
// //             final product = snapshot.data![index];
// //             return Card(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     Image.network(
// //                       product['image'],
// //                       width: 100,
// //                       height: 100,
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Text(
// //                       "${product['title']}",
// //                       maxLines: 2,
// //                     ),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text(product['price'].toString()),
// //                         IconButton(
// //                             onPressed: () {},
// //                             icon: Icon(Icons.favorite_outline_outlined)),
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             );
// //           },
// //           itemCount: snapshot.data!.length,
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //               crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
// //         );
// //       },
// //     );
// //   }
// // }

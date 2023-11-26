//import 'package:e_cart/screens/home_screen.dart';
import 'package:e_cart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_cart/screens/cart.dart';
import 'package:e_cart/screens/favourite.dart';
import 'package:e_cart/screens/profile.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Front extends StatefulWidget {
  Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  int currentIndex = 0;
  List screens = [
    HomeScreen(),
    const Profile(),
    const Favourite(),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E-Kart'),
          backgroundColor: Colors.blue,
        ),
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
              child: screens[currentIndex],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart')
          ],
          selectedIconTheme: IconThemeData(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedLabelStyle: TextStyle(
              color: Colors.blue), // Change the color of the selected icon
          unselectedIconTheme: IconThemeData(color: Colors.grey),
        ));
  }
}

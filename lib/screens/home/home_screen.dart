// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/components/bottom_navbar.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/shop/shop_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This selected index is to control bottom navbar
  int _selectedIndex = 0;

  // This method will update our selected index (when user tabs on the bottom bar)
  void navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Shop screen
    const ShopScreen(),

    // Cart screen
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(Icons.menu),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          )),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                      height: 170,
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset('assets/images/nike.png',
                          color: Colors.white)),
                ),

                // Divider
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Divider(color: Colors.grey[800]),
                ),

                // Other screens

                // Home
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                ),

                // About
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(Icons.info),
                    title: Text('About'),
                  ),
                ),
              ],
            ),
            // Logout
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 25.0),
              child: ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

/*
drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            // Logo
            Container(
                height: 200,
                padding: const EdgeInsets.only(top: 25),
                child:
                    Image.asset('assets/images/nike.png', color: Colors.white))
            // Other screens
          ],
        ),
      ),
*/

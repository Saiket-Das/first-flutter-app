// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // Add shoe to cart
  void addToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // Alert the user, shoe succesfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successfully added'),
              content: Text('Check our cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                // Search bar
                Container(
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Search...'),
                      Icon(Icons.search),
                    ],
                  ),
                ),

                // Message
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text('everyone file.. some fly longer than others',
                      style: TextStyle(color: Colors.grey[600])),
                ),

                // Hot pics
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Hot picks 🔥',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),

                // Divider
                const SizedBox(
                  height: 24,
                ),

                // List of shoes for sale
                Expanded(
                    child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    // Return shoes
                    return ShoeTile(
                      shoe: shoe,
                      onTab: () => addToCart(shoe),
                    );
                  },
                ))
              ],
            ));
  }
}

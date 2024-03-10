import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShot = [
    Shoe(
        name: 'Zoom FREAK',
        price: '235',
        imagePath: 'assets/images/shoe_1.jpg',
        description: 'The forward-thinking of this latest signature shoe'),
    Shoe(
        name: 'Air Jordan',
        price: '235',
        imagePath: 'assets/images/shoe_2.jpg',
        description:
            'Manifest your mountainous best, when the trail ahead is skiddy and uncertain.'),
    Shoe(
        name: 'KD Treys',
        price: '235',
        imagePath: 'assets/images/shoe_3.jpg',
        description:
            'The Juniper Trail 2 has waterproof GORE-TEX on the upper, grippy traction and a soft, cushiony midsole.'),
    Shoe(
        name: 'Kyrie 6',
        price: '235',
        imagePath: 'assets/images/shoe_4.jpg',
        description: 'The forward-thinking of this latest signature shoe'),
  ];

  // List of item in user cart
  List<Shoe> userCart = [];

  // Get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShot;
  }

  // Get user cart items
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add new item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

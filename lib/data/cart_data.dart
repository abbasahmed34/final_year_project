// lib/data/cart_data.dart
import 'package:final_year_project/models/food_item.dart';

class CartData {
  static List<FoodItem> _cartItems = []; // A list to store cart items

  // Fetch the user's cart items
  static List<FoodItem> fetchCartItems() {
    return _cartItems;
  }

  // Add an item to the cart
  static void addToCart(FoodItem item) {
    _cartItems.add(item);
  }

  // Remove an item from the cart
  static void removeFromCart(FoodItem item) {
    _cartItems.remove(item);
  }

  // Calculate the total price of items in the cart
  static double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }
}

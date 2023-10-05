// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Cart'),
        backgroundColor: Theme.of(context).primaryColor, // Use the primary color from the theme
      ),
      body: ListView.builder(
        itemCount: 0, // Replace with the number of cart items
        itemBuilder: (context, index) {
          // Replace this with logic to display cart items
          return const ListTile(
            leading: Icon(Icons.fastfood), // Replace with item image
            title: Text('Item Name'), // Replace with item name
            subtitle: Text('Item Description'), // Replace with item description
            trailing: Text('\$XX.XX'), // Replace with item price
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Total: \Rs. XX.XX'), // Implement logic to calculate the total price
              ElevatedButton(
                onPressed: () {
                  // Implement logic to proceed to the checkout screen
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor, // Use the primary color from the theme
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

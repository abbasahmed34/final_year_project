// lib/screens/details_screen.dart
import 'package:flutter/material.dart';
import 'package:final_year_project/models/food_item.dart';

class DetailsScreen extends StatelessWidget {
  final FoodItem item;

  const DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodChef - Details'),
        backgroundColor: Theme.of(context).primaryColor, // Use the primary color from the theme
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(item.imageUrl),
            const SizedBox(height: 16.0),
            Text(item.name, style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 8.0),
            Text(item.description, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 8.0),
            Text('\Rs. ${item.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement the functionality to add the item to the cart here
                // You can manage the cart state using your preferred state management solution.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Customize the button color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:final_year_project/models/food_item.dart';
import 'package:final_year_project/data/food_data.dart';
import 'package:final_year_project/screens/user_listings_details.dart';

class ListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<FoodItem> foodItems = FoodData.fetchFoodItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Listings'),
        backgroundColor: Theme.of(context).primaryColor, // Set app bar background color
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final FoodItem item = foodItems[index];
          return ListTile(
            leading: Image.network(item.imageUrl),
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text('\Rs. ${item.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen(item: item)),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:final_year_project/screens/user_listings.dart';
import 'package:final_year_project/screens/user_listings.dart';

class DiscoverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor, // Set app bar background color
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search bar (you can customize this)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for dishes...',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
                // Implement search logic
              ),
            ),

            // Dish Collections (you can customize this)
            Text('This Page will have trending dishes.'),
            Container(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Replace with your collection count
                itemBuilder: (context, index) {
                  return Card(
                  );

                },
              ),
            ),

            // Slider Cards (you can customize this)
            // Implement slider cards using a package like CarouselSlider

            // Filter Buttons (you can customize this)
            // Implement filter buttons using a ListView or Row
          ],
        ),
      ),
    );
  }
}

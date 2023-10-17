//lib/screens/favourites.dart
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favourites'),
        backgroundColor: Theme.of(context).primaryColor, // Set app bar background color
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Favourite Item 1'),
            Text('Favourite Item 2'),
            Text('Favourite Item 3'),
            // Add more user profile information as needed
          ],
        ),
      ),
    );
  }
}

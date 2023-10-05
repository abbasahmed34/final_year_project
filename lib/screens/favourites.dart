import 'package:flutter/material.dart';
import 'package:final_year_project/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

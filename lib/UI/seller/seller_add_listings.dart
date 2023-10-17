import 'package:flutter/material.dart';
import 'package:final_year_project/data/listings_service.dart';

class AddListingScreen extends StatefulWidget {
  @override
  _AddListingScreenState createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final ListingsService _listingsService = ListingsService();

  String name = ''; // User-provided name
  String description = ''; // User-provided description
  String imageUrl = ''; // User-provided image URL
  double price = 0.0; // User-provided price

  void _submitListing() {
    _listingsService.addListing(name, description, imageUrl, price).then((_) {
      // Successfully added the listing to Firestore
      // You can handle success and navigate to a new screen, show a confirmation, etc.
    }).catchError((error) {
      // Handle any errors that occurred during the process
      print('Error adding listing: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) {
                description = value;
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              onChanged: (value) {
                imageUrl = value;
              },
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              onChanged: (value) {
                price = double.parse(value);
              },
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitListing,
              child: Text('Submit New Listing'),
            ),
          ],
        ),
      ),
    );
  }
}

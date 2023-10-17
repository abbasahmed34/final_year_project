import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Food Listings'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('listings').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator()); // Loading indicator
          }

          // Get the listings data from Firestore
          final listings = snapshot.data!.docs;

          return ListView.builder(
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final listing = listings[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: Image.network(listing['imageUrl']),
                title: Text(listing['name']),
                subtitle: Text(listing['description']),
                trailing: Text('\Rs. ${listing['price'].toStringAsFixed(2)}'),
                onTap: () {
                  // Handle item tap
                },
              );
            },
          );
        },
      ),
    );
  }
}

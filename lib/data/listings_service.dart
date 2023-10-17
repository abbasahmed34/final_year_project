import 'package:cloud_firestore/cloud_firestore.dart';

class ListingsService {
  final CollectionReference _listingsCollection =
  FirebaseFirestore.instance.collection('listings');

  Future<void> addListing(String name, String description, String imageUrl, double price) {
    return _listingsCollection.add({
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Utils/Routes/routes_names.dart';

class UserProfile extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userData =
      await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _user = user;
        _userData = userData.data() as Map<String, dynamic>?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_user != null)
              Column(
                children: [
                  if (_userData != null && _userData!['image_url'] != null)
                    Container(
                      width: 120, // Set your desired width
                      height: 120, // Set your desired height
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle, // This makes the container a square
                        borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                        image: DecorationImage(
                          image: NetworkImage(_userData!['image_url']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  Text('Username: ${_userData!['username']}'),
                  Text('Email: ${_userData!['email']}'),
                ],
              ),
            if (_user != null)
              ElevatedButton(
                onPressed: () {
                  // Sign out user
                  _auth.signOut();
                  Navigator.pushNamed(context, RoutesName.login);
                  },
                child: Text('Sign Out'),
              ),
          ],
        ),
      ),
    );
  }
}

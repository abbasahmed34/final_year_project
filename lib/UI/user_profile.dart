import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/resources/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Routes/routes_names.dart';

class UserProfile extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _imagePicker = ImagePicker();

  User? _user;
  Map<String, dynamic>? _userData;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userData = await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _user = user;
        _userData = userData.data() as Map<String, dynamic>?;
        _nameController.text = _userData?['name'] ?? '';
        _emailController.text = _userData?['email'] ?? '';
        _phoneController.text = _userData?['phone'] ?? '';
        _usernameController.text = _userData?['username'] ?? '';
      });
    }
  }

  Future<void> _updateProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'username': _usernameController.text,
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Handle the image captured via the camera.
      // Update the 'image_url' in Firestore with the URL of the captured image.
      // For simplicity, we're not covering the image upload process here.
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle the image selected from the gallery.
      // Update the 'image_url' in Firestore with the URL of the selected image.
      // For simplicity, we're not covering the image upload process here.
    }
  }

  Future<void> _pickImage() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _pickImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _pickImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
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
                  Stack(
                    children: [
                      if (_userData != null && _userData!['image_url'] != null)
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(_userData!['image_url']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Positioned(
                        bottom: -15,
                        right: -15,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: IconButton(
                            onPressed: () {
                              _pickImage();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle name edit
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle email edit
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: 'Phone Number'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle phone number edit
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Username'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle username edit
                        },
                        icon: Icon(Icons.edit),
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ],
              ),
            if (_user != null)
              ElevatedButton(
                onPressed: () {
                  _updateProfile();
                  _auth.signOut();
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text('Logout'),
              ),
          ],
        ),
      ),
    );
  }
}

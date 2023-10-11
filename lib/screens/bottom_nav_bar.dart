//lib/screens/bottom_nav_bar.dart
import 'package:final_year_project/screens/about.dart';
import 'package:final_year_project/screens/cart.dart';
import 'package:final_year_project/screens/chat.dart';
import 'package:final_year_project/screens/seller/seller_nav_bar.dart';
import 'package:final_year_project/screens/user_listings.dart';
import 'package:final_year_project/screens/favourites.dart';
import 'package:final_year_project/screens/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chefs_or_sellers.dart';
import 'discover.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  int _currentIndex = 0; // Index of the currently selected tab
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    //const SplashScreen(),
    DiscoverScreen(),
    ListingsScreen(),
    ChefsOrSellers(),
    const FavouritesScreen(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 4) {
            // Open the drawer when "More" is tapped
            _scaffoldKey.currentState?.openEndDrawer();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.explore, color: Colors.white),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.fastfood, color: Colors.white),
            label: 'Listings',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.menu, color: Colors.white),
            label: 'More', // Change label as needed
          ),
        ],
      ),
      endDrawer: Drawer(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Abbas Ahmed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "+92 3190076361",
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const UserProfile(), // Replace YourNextScreen with the screen you want to navigate to
                  ));
                },
                title: const Text(
                  "My Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.account_circle_outlined,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const SellerBottomNavBar(), // Replace YourNextScreen with the screen you want to navigate to
                  ));
                },
                title: const Text(
                  "Seller Mode",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.switch_account_outlined,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigate to the new screen when the ListTile is tapped
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const ChatScreen(), // Replace YourNextScreen with the screen you want to navigate to
                  ));
                },
                title: const Text(
                  "Messaging",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.message_rounded,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const FavouritesScreen(), // Replace YourNextScreen with the screen you want to navigate to
                  ));
                },
                title: const Text(
                  "Favourites",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.favorite_border,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigate to the new screen when the ListTile is tapped
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const CartScreen(), // Replace YourNextScreen with the screen you want to navigate to
                  ));
                },
                title: const Text(
                  "Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.add_shopping_cart,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                },
                title: const Text(
                  "Help Center",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.help_outline,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                },
                title: const Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.info_outline,
                  size: 26,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "Share",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: Icon(
                  Icons.share,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                title: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                leading: const Icon(
                  Icons.logout,
                  size: 26,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 90),
              const Center(child: Text('Version 1.0')),
            ],
          ),
        ),
      )),
    );
  }
}

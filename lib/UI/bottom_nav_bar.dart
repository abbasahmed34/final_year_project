//lib/screens/bottom_nav_bar.dart
import 'package:final_year_project/UI/about.dart';
import 'package:final_year_project/UI/cart.dart';
import 'package:final_year_project/UI/chat.dart';
import 'package:final_year_project/UI/help_center.dart';
import 'package:final_year_project/UI/seller/seller_nav_bar.dart';
import 'package:final_year_project/UI/user_listings.dart';
import 'package:final_year_project/UI/favourites.dart';
import 'package:final_year_project/UI/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../Utils/Routes/routes_names.dart';
import '../resources/components/app_colors.dart';
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
    DiscoverScreen(),
    ListingsScreen(),
    ChefsOrSellers(),
    const FavouritesScreen(),
  ];

  void _shareApp() {
    final RenderBox box = context.findRenderObject() as RenderBox;
    Share.share(
      'Check out this awesome app: HomeChef FoodLink',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
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
            icon: Icon(
              Icons.explore,
              color: _currentIndex == 0 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
              color: _currentIndex == 1 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Listings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 2 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Sellers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: _currentIndex == 3 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: _currentIndex == 4 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'More', // Change label as needed
          ),
        ],
        selectedItemColor: AppColors.mainColor,
      ),
      endDrawer: Drawer(
          child: SingleChildScrollView(
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
                          UserProfile(), // Replace YourNextScreen with the screen you want to navigate to
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
                        builder: (context) => FAQPage(),
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
                ListTile(
                  onTap: _shareApp,
                  title: const Text(
                    "Share",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  leading: const Icon(
                    Icons.share,
                    size: 26,
                  ),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, RoutesName.login);
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
        ),
      )),
    );
  }
}

//lib/screens/seller/seller_nav_bar.dart
import 'package:final_year_project/UI/seller/seller_add_listings.dart';
import 'package:final_year_project/resources/components/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../bottom_nav_bar.dart';
import '../chat.dart';
import '../user_listings.dart';

class SellerBottomNavBar extends StatefulWidget {
  const SellerBottomNavBar({super.key});

  @override
  State<SellerBottomNavBar> createState() => _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends State<SellerBottomNavBar> {
  @override
  int _currentIndex = 0; // Index of the currently selected tab
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    ListingsScreen(),
    AddListingScreen(),
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
          if (index == 2) {
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
              Icons.fastfood,
              color: _currentIndex == 0 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Listings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: _currentIndex == 1 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Add Listings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: _currentIndex == 2 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'More', // Change label as needed
          ),
        ],
      ),
      endDrawer: Drawer(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://scontent.fisb4-2.fna.fbcdn.net/v/t39.30808-6/386508331_2211356735719070_8419298046350846657_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeF2he_udXY6li3HxYZOIkBkpizuRFmiwl2mLO5EWaLCXbnJJ1Kgfq0hjCCiPCaxzwx_P-56FYuMfJPgehS6YIi9&_nc_ohc=qwY8eb54XU8AX_IdY14&_nc_zt=23&_nc_ht=scontent.fisb4-2.fna&oh=00_AfBknncAZ1KCiJ8yuXIw8KYn-u1LzezUqPLMBR2N_Tc61w&oe=65212CA8'),
              ),
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
                "My Food App",
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  // Navigate to the new screen when the ListTile is tapped
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const BottomNavBar(), // Replace YourNextScreen with the screen you want to navigate to
                  ));
                },
                title: const Text(
                  "Return Buyer Mode",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.list_outlined,
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
                  "Messages",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.message_rounded,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                title: const Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: const Icon(
                  Icons.logout,
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
              const ListTile(
                title: Text(
                  "Help and Feedback",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                leading: Icon(
                  Icons.help_outline,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:final_year_project/screens/user_listings.dart';
import 'package:final_year_project/screens/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
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
    CartScreen(),
    const ProfileScreen(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if(index == 4){
            // Open the drawer when "More" is tapped
            _scaffoldKey.currentState?.openEndDrawer();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }

        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.explore, color: Colors.white),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.fastfood, color: Colors.white),
            label: 'Listings',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.menu, color: Colors.white),
            label: 'More', // Change label as needed
          ),
        ],
      ),
      endDrawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://scontent.fisb4-2.fna.fbcdn.net/v/t39.30808-6/386508331_2211356735719070_8419298046350846657_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeF2he_udXY6li3HxYZOIkBkpizuRFmiwl2mLO5EWaLCXbnJJ1Kgfq0hjCCiPCaxzwx_P-56FYuMfJPgehS6YIi9&_nc_ohc=qwY8eb54XU8AX_IdY14&_nc_zt=23&_nc_ht=scontent.fisb4-2.fna&oh=00_AfBknncAZ1KCiJ8yuXIw8KYn-u1LzezUqPLMBR2N_Tc61w&oe=65212CA8'),

                  ),
                  const SizedBox(height: 30,),
                  const Text("Abbas Ahmed",style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 5,),
                  Text("My Food App",style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 30,),
                  const Divider(),
                  const ListTile(
                    title: Text("Seller Mode",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16

                    ),),
                    leading: Icon(Icons.list_outlined,size: 26,),
                  ),
                  const ListTile(
                    title: Text("Messages",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16

                    ),),
                    leading: Icon(Icons.message_rounded,size: 26,),
                  ),
                  ListTile(
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                    },
                    title: Text("Logout",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16

                    ),),
                    leading: Icon(Icons.logout,size: 26,),
                  ),
                  const SizedBox(height: 30,),
                  const Divider(),
                  const ListTile(
                    title: Text("Share",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16

                    ),),
                    leading: Icon(Icons.share,size: 26,),
                  ),
                  const ListTile(
                    title: Text("Help and Feedback",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16

                    ),),
                    leading: Icon(Icons.help_outline,size: 26,),
                  ),


                ],
              ),
            ),
          )
      ),
    );
  }
}


//lib/main.dart
import 'package:final_year_project/screens/bottom_nav_bar.dart';
import 'package:final_year_project/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:final_year_project/screens/auth.dart';


final ThemeData myTheme = ThemeData(
  primaryColor: Color(0xfff97930), // Primary color
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xfff97930), // Primary color
    secondary: Colors.white, // Accent color
  ),
  fontFamily: 'Roboto', // Font family
);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: myTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SplashScreen();
          }
          if (snapshot.hasData){
            return const BottomNavBar();
          }

          return const AuthScreen();
        },
      ),
    );
  }
}
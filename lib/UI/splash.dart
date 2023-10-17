//lib/screens/splash.dart
import 'package:final_year_project/Firebase_services/Authentication_services/splash_screen_services.dart';
import 'package:final_year_project/UI/bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      splashServices.isLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 500,
          child: Image(
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}

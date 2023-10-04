import 'package:final_year_project/main.dart';
import 'package:final_year_project/screens/discover.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 3 seconds (3000 milliseconds)
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the main content screen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => App()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading....!'),
      ),
    );
  }
}

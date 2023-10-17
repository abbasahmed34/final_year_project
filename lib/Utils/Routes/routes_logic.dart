
import 'package:final_year_project/UI/bottom_nav_bar.dart';
import 'package:final_year_project/Utils/Routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../../UI/Authentication_screens/forgetpassword_screen.dart';
import '../../UI/Authentication_screens/login_screen.dart';
import '../../UI/Authentication_screens/signup_screen.dart';
import '../../UI/splash.dart';
import '../../UI/welcome.dart';

class Routes{

  static Route<dynamic> generateRoutes(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splashscreen :
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
      case RoutesName.welcome :
        return MaterialPageRoute(builder: (context)=> const WelcomeScreen());
      case RoutesName.login :
        return MaterialPageRoute(builder:(context) => const LoginScreen());
      case RoutesName.signup :
        return MaterialPageRoute(builder:(context) => const SignupScreen());
      case RoutesName.forgetPassword :
        return MaterialPageRoute(builder:(context) => const ForgetPasswordScreen());
      case RoutesName.home :
        return MaterialPageRoute(builder:(context) => const BottomNavBar());
      default :
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text("No Such Route"),
            ),
          );
        });

    }

  }

}
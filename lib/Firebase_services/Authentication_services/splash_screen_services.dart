import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utils/Routes/routes_names.dart';

class SplashServices{

  final _auth = FirebaseAuth.instance;
  isLogin(context){

    final user = _auth.currentUser;

    if(user!=null){
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RoutesName.home);
      });
    }else{
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RoutesName.welcome);
      });
    }
  }



}
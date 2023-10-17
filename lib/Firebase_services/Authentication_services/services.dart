

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Utils/Routes/routes_names.dart';
import '../../Utils/utils.dart';
import '../../view_model/provider_auth_services.dart';

class FirebaseAuthenticationServices {

  final _auth = FirebaseAuth.instance;


  signUp(email, password,context){
    final provider = Provider.of<ProviderService>(context,listen: false);
    _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      provider.setLoading(false);
      Utils.flushBarSuccessMessage("User Registered Successfully", context);
    }).onError((error, stackTrace) {
      provider.setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  logIn(email, password, context){
    final provider = Provider.of<ProviderService>(context,listen: false);
    _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      provider.setLoading(false);
      Utils.flushBarSuccessMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace){
      provider.setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  forgotPassword(email,context){
    final provider = Provider.of<ProviderService>(context,listen: false);
    _auth.sendPasswordResetEmail(email: email).then((value){
      provider.setLoading(false);
      Utils.flushBarSuccessMessage("Password Reset Email address send to your email please check", context);
      Navigator.pushNamed(context, RoutesName.login);
    }).onError((error, stackTrace){
      provider.setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }



}
import 'package:cloudgaming/pages/Login.dart';
import 'package:cloudgaming/pages/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isIn = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        //return AuthPage();
      } else {
        isIn = true;
        //return MyHome();
      }
    });

    return isIn ? MyHome() : LoginScreen();
  }
}

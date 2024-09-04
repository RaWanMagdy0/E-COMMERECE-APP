import 'dart:async';
import 'package:e_comerence_app/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routName);
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/Splash Screen.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

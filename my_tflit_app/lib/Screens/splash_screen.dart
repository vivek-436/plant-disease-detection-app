import 'dart:async';

import 'package:agro_gaurdian/extrascreen/get_start.dart';
import 'package:agro_gaurdian/Screens/register_screen.dart';
import 'package:agro_gaurdian/extrascreen/select_language.dart';
import 'package:agro_gaurdian/utils/colors.dart';

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
    // Simulate a delay and then navigate to the home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your logo or splash screen image here
            Image.asset(
              'assets/Group242.png', // Replace with your image asset
            ),
          ],
        ),
      ),
    );
  }
}

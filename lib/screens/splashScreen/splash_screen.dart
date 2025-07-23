import 'dart:async';

import 'package:flutter/material.dart';

import '../wellcomeScreen/wellcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // builder: (context) => user != null ? BottomNavBar() : LoginScreen(),
          builder: (context) => WellcomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/image/splashscreen.png',
            ), // your image path
            fit: BoxFit.cover, // cover, contain, fill, etc.
          ),
        ),
        child: Center(child: Text('Powered By Shah Brothers')),
      ),
    );
  }
}

import 'dart:async';
import 'package:ecommer_easy_app/controllers/user_get_data_controller.dart';
import 'package:ecommer_easy_app/screens/adminScreen/admin_screen.dart';
import 'package:ecommer_easy_app/userPannel/homeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wellcomeScreen/wellcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      loggdin(context);
    });
  }

  // Checking Method user is already login or Not....
  Future<void> loggdin(BuildContext context) async {
    if (user != null) {
      final UserGetDataController userGetDataController = Get.put(
        UserGetDataController(),
      );
      // Checking Method user is Admin or not.....
      var userData = await userGetDataController.getUserData(user!.uid);
      if (userData[0]['isAdmin'] == true) {
        Get.offAll(AdminScreen());
      } else {
        Get.offAll(HomeScreen());
      }
    } else {
      Get.offAll(WellcomeScreen());
    }
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

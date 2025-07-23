// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/auth/login_screen.dart';

signUpUser(
  String userName,
  String userPhone,
  String userEmail,
  String userPassword,
  String userCityName,
) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userid!.uid)
        .set({
          'userName': userName,
          'userPhone': userPhone,
          'userEmail': userEmail,
          'userPassword': userPassword,
          'userCityName': userCityName,
          'currentUserID': userid.uid,
          'dateAndTime': DateTime.now(),
        })
        .then(
          (value) => {
            FirebaseAuth.instance.signOut(),

            Get.to(() => LoginScreen()),
          },
        );
  } on FirebaseAuthException catch (e) {
    print('Errror $e');
  }
}

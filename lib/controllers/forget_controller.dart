// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> forgetPasswordMethod(String userEmail) async {
    try {
      // loading ? CircularProgressIndicator(backgroundColor: Colors.amber) : null;
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: userEmail);

      Get.snackbar(
        'Request Sent Successfuly',
        'Password reset link sent to $userEmail',
      );
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', '$e');
    }
  }
}

// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // bool loading = true;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  Future<UserCredential?> signInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      // loading ? CircularProgressIndicator(backgroundColor: Colors.amber) : null;
      isLoading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      isLoading.value = false;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', '$e');
    }
    return null;
  }
}

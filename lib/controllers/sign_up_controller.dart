// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommer_easy_app/controllers/get_device_token_controller.dart';
import 'package:ecommer_easy_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // bool loading = true;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {
    GetDeviceTokenController getDeviceTokenController = Get.put(
      GetDeviceTokenController(),
    );
    try {
      // loading ? CircularProgressIndicator(backgroundColor: Colors.amber) : null;
      isLoading.value = true;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: userEmail,
            password: userPassword,
          );
      // send email for verification...
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: userName,
        email: userEmail,
        phone: userPhone,
        userImg: '',
        userDeviceToken: getDeviceTokenController.deviceToken.toString(),
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: userCity,
      );

      // Add data into database...
      _firestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      // loading = false;
      isLoading.value = false;
      Get.back();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', '$e');
    }
    return null;
  }
}

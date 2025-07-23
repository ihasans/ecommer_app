import 'package:ecommer_easy_app/controllers/sign_up_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());

  TextEditingController userNameController = TextEditingController();

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userCityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: AppConstant.header1Text.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 120.h,

                child: Center(
                  child: Image.asset(
                    'assets/image/firstimage.png',

                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('User Name', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.sp,
                      ),
                      height: 42.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(6.sp),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          // hintStyle: body2Text,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text('Phone', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.sp,
                      ),
                      height: 42.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(6.sp),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: userPhoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone',
                          // hintStyle: body2Text,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text('Email', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.sp,
                      ),
                      height: 42.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(6.sp),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: userEmailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          // hintStyle: body2Text,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Text('Password', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 0,
                      ),
                      height: 42.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(6.sp),
                        color: Colors.white,
                      ),
                      child: Obx(
                        () => TextFormField(
                          controller: userPasswordController,
                          obscureText: signUpController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',

                            // hintStyle: body2Text,
                            suffixIcon: IconButton(
                              onPressed: () {
                                signUpController.isPasswordVisible.toggle();
                              },
                              icon: signUpController.isPasswordVisible.value
                                  ? Icon(Icons.visibility, color: Colors.grey)
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text('City Name', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.sp,
                      ),
                      height: 42.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(6.sp),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: userCityController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'City Name',
                          // hintStyle: body2Text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () async {
                    String userName = userNameController.text.trim();
                    String userEmail = userEmailController.text.trim();
                    String userPhone = userPhoneController.text.trim();
                    String userPassword = userPasswordController.text.trim();
                    String userCity = userCityController.text.trim();
                    String userDeviceToken = '';
                    if (userName.isEmpty ||
                        userEmail.isEmpty ||
                        userPhone.isEmpty ||
                        userPassword.isEmpty ||
                        userCity.isEmpty) {
                      Get.snackbar('Error', 'Please enter all details');
                    } else {
                      UserCredential? userCredential = await signUpController
                          .signUpMethod(
                            userName,
                            userEmail,
                            userPhone,
                            userCity,
                            userPassword,
                            userDeviceToken,
                          );
                      if (userCredential != null) {
                        Get.snackbar(
                          'Verification email sent',
                          'Please check your Email',
                        );
                      }
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstant.appMainColor, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Corner radius
                    ),
                  ),
                  child: Text('Sign Up', style: AppConstant.buttonText),
                ),
              ),
              Obx(
                () => signUpController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Container(),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: AppConstant.subTitleText,
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: AppConstant.appMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';
import '../auth/login_screen.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Center(
          child: Text('Welcome to Our App!', style: AppConstant.header1Text),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppConstant.appMainColor,
            ),
            child: Center(
              child: Image.asset(
                'assets/image/firstimage.png',
                width: 300.w,
                height: 300.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Shop With Confidence',
            style: AppConstant.buttonText.copyWith(color: Colors.black),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Container(
              width: double.infinity,
              height: 42.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppConstant.appMainColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/icons/google.png'),
                    width: 34.w,
                    height: 34.h,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10.h),
                  Text('Sign in with Google', style: AppConstant.buttonText),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () {
              Get.to(LoginScreen());
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => LoginScreen()),
              // );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppConstant.appMainColor,
                ),
                width: double.infinity,
                height: 42.h,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/icons/email.png'),
                      width: 30.w,
                      height: 30.h,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.h),
                    Text('Sign in with Email', style: AppConstant.buttonText),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

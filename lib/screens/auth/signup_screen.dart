import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          // hintStyle: body2Text,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility, color: Colors.grey),
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
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstant.appMainColor, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Corner radius
                    ),
                  ),
                  child: Text('Sign Up', style: AppConstant.buttonText),
                ),
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

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool _isPasswordObscure = true;
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController userEmailController = TextEditingController();
//   TextEditingController userPhoneController = TextEditingController();
//   TextEditingController userPasswordController = TextEditingController();
//   TextEditingController userCityNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Sign Up',
//           style: AppConstant.header1Text.copyWith(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.sp),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: 120.h,

//                 child: Center(
//                   child: Image.asset(
//                     'assets/image/firstimage.png',

//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               Form(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('User Name', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 10.sp,
//                       ),
//                       height: 42.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, width: 1),
//                         borderRadius: BorderRadius.circular(6.sp),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: userNameController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Name',
//                           // hintStyle: body2Text,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     Text('Phone', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 10.sp,
//                       ),
//                       height: 42.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, width: 1),
//                         borderRadius: BorderRadius.circular(6.sp),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: userPhoneController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Phone',
//                           // hintStyle: body2Text,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     Text('Email', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 10.sp,
//                       ),
//                       height: 42.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, width: 1),
//                         borderRadius: BorderRadius.circular(6.sp),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: userEmailController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Email',
//                           // hintStyle: body2Text,
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 8.h),
//                     Text('Password', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 0,
//                       ),
//                       height: 42.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, width: 1),
//                         borderRadius: BorderRadius.circular(6.sp),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: userPasswordController,
//                         obscureText: _isPasswordObscure,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Password',
//                           // hintStyle: body2Text,
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordObscure = !_isPasswordObscure;
//                               });
//                             },
//                             icon: Icon(
//                               _isPasswordObscure
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     Text('City Name', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 10.sp,
//                       ),
//                       height: 42.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, width: 1),
//                         borderRadius: BorderRadius.circular(6.sp),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: userCityNameController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'City Name',
//                           // hintStyle: body2Text,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               SizedBox(
//                 width: double.infinity,
//                 height: 40.h,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     var userName = userNameController.text.trim();
//                     var userPhone = userPhoneController.text.trim();
//                     var userEmail = userEmailController.text.trim();
//                     var userPassword = userPasswordController.text.trim();

//                     var userCityName = userCityNameController.text.trim();

//                     // Firebase Authentication through Name and Passwor

//                     try {
//                       await FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                             email: userEmail,
//                             password: userPassword,
//                           );
//                       signUpUser(
//                         userName,
//                         userPhone,
//                         userEmail,
//                         userPassword,
//                         userCityName,
//                       );
//                       Navigator.pop(context);

//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Account created successfully')),
//                       );
//                     } on FirebaseAuthException catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Error: ${e.toString()}')),
//                       );
//                     }
//                   },

//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppConstant.appMainColor, // Button color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6), // Corner radius
//                     ),
//                   ),
//                   child: Text('Sign Up', style: AppConstant.buttonText),
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Align(
//                 alignment: Alignment.center,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       text: "Already have an account? ",
//                       style: AppConstant.subTitleText,
//                       children: [
//                         TextSpan(
//                           text: 'Login',
//                           style: TextStyle(
//                             color: AppConstant.appMainColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

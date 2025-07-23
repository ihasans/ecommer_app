import 'package:ecommerce_app/screens/auth/forget_screen.dart';
import 'package:ecommerce_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Login',
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
              SizedBox(height: 10.h),
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
              SizedBox(height: 20.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Email', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.sp,
                      ),
                      height: 46.h,
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
                    SizedBox(height: 16.h),
                    Text('Password', style: AppConstant.subTitleText),
                    SizedBox(height: 8.h),

                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 0,
                      ),
                      height: 46.h,
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
                  ],
                ),
              ),
              SizedBox(height: 40.h),
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
                  child: Text('Login', style: AppConstant.buttonText),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetScreen()),
                    );
                  },
                  child: Text(
                    'Forget Password',
                    style: AppConstant.subTitleText.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: AppConstant.subTitleText,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
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

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _isPasswordObscure = true;
//   TextEditingController userEmailController = TextEditingController();
//   TextEditingController userPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Login',
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
//               SizedBox(height: 10.h),
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
//               SizedBox(height: 20.h),
//               Form(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Email', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 10.sp,
//                       ),
//                       height: 46.h,
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
//                     SizedBox(height: 16.h),
//                     Text('Password', style: AppConstant.subTitleText),
//                     SizedBox(height: 8.h),

//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16.w,
//                         vertical: 0,
//                       ),
//                       height: 46.h,
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
//                   ],
//                 ),
//               ),
//               SizedBox(height: 40.h),
//               SizedBox(
//                 width: double.infinity,
//                 height: 40.h,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     final userEmail = userEmailController.text.trim();
//                     final userPassword = userPasswordController.text.trim();

//                     try {
//                       final UserCredential userCredential = await FirebaseAuth
//                           .instance
//                           .signInWithEmailAndPassword(
//                             email: userEmail,
//                             password: userPassword,
//                           );

//                       if (userCredential.user != null) {
//                         // Navigate to HomeScreen
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomeScreen()),
//                         );
//                       } else {
//                         // Null user (unexpected)
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Check email and password')),
//                         );
//                       }
//                     } on FirebaseAuthException catch (e) {
//                       // Handle specific errors
//                       String message = 'Check email and password';
//                       if (e.code == 'user-not-found') {
//                         message = 'No user found for that email.';
//                       } else if (e.code == 'wrong-password') {
//                         message = 'Incorrect password.';
//                       }

//                       ScaffoldMessenger.of(
//                         context,
//                       ).showSnackBar(SnackBar(content: Text(message)));
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppConstant.appMainColor, // Button color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6), // Corner radius
//                     ),
//                   ),
//                   child: Text('Login', style: AppConstant.buttonText),
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ForgetScreen()),
//                     );
//                   },
//                   child: Text(
//                     'Forget Password',
//                     style: AppConstant.subTitleText.copyWith(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreen()),
//                     );
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       text: "Don't have an account? ",
//                       style: AppConstant.subTitleText,
//                       children: [
//                         TextSpan(
//                           text: 'Sign Up',
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

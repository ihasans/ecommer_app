import 'package:ecommer_easy_app/controllers/forget_controller.dart';
import 'package:ecommer_easy_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  ForgetController forgetController = Get.put(ForgetController());
  TextEditingController userEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Forget Password'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Email'),
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
                        controller: userEmailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          // hintStyle: body2Text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              // Obx(
              //   () =>
              // ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    String userEmail = userEmailController.text.trim();
                    if (userEmail.isEmpty) {
                      Get.snackbar('Error', 'Please Enter Email');
                    } else {
                      forgetController.forgetPasswordMethod(userEmail);
                      Get.offAll(LoginScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Corner radius
                    ),
                  ),
                  child: Text(
                    'Forget Password',
                    style: TextStyle(color: Colors.white),
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
// { }


// class ForgetScreen extends StatefulWidget {
//   const ForgetScreen({super.key});

//   @override
//   State<ForgetScreen> createState() => _ForgetScreenState();
// }

// class _ForgetScreenState extends State<ForgetScreen> {
//   TextEditingController forgetPasswordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Forget Password'),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.sp),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40.h),
//               Form(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Email'),
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
//                         controller: forgetPasswordController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Email',
//                           // hintStyle: body2Text,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 40.h),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     var forgetPassword = forgetPasswordController.text.trim();

//                     try {
//                       await FirebaseAuth.instance
//                           .sendPasswordResetEmail(email: forgetPassword)
//                           .then((value) => {print('Email sent!')});
//                     } on FirebaseAuthException catch (e) {
//                       print('Error $e');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueGrey, // Button color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6), // Corner radius
//                     ),
//                   ),
//                   child: Text(
//                     'Forget Password',
//                     style: TextStyle(color: Colors.white),
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
// // { }
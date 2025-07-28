import 'package:ecommer_easy_app/screens/auth/login_screen.dart';
import 'package:ecommer_easy_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDrawar extends StatefulWidget {
  const CustomDrawar({super.key});

  @override
  State<CustomDrawar> createState() => _CustomDrawarState();
}

class _CustomDrawarState extends State<CustomDrawar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.sp, bottom: 20.sp),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppConstant.appMainColor,
                child: Text('W'),
              ),
              title: Text('Wrape'),
              subtitle: Text('Version: 1.0.1'),
            ),
          ),

          Divider(
            indent: 10.sp,
            endIndent: 10.sp,
            thickness: 1.5,
            color: AppConstant.appSecondoryColor,
          ),
          SizedBox(height: 30.h),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home_filled),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
          ListTile(
            title: Text('Product'),
            leading: Icon(Icons.shopping_cart),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
          ListTile(
            title: Text('Order'),
            leading: Icon(Icons.shopping_bag),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
          ListTile(
            title: Text('Contact'),
            leading: Icon(Icons.contact_support_sharp),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Get.offAll(LoginScreen());
            },
            title: Text('Logout'),
            leading: Icon(Icons.login_rounded),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
        ],
      ),
    );
  }
}

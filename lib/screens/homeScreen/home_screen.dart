import 'package:ecommer_easy_app/utils/app_constant.dart';
import 'package:ecommer_easy_app/widgets/custom_drawar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/banner_widget.dart';
import '../auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('Home Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Icon(Icons.logout_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      drawer: CustomDrawar(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: BannerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

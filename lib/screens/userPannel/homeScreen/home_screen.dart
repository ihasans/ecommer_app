import 'package:ecommer_easy_app/screens/userPannel/allFlashSaleScreen/allFlashSaleScreen.dart';
import 'package:ecommer_easy_app/screens/userPannel/allProducts/all_products_screen.dart';
import 'package:ecommer_easy_app/utils/app_constant.dart';
import 'package:ecommer_easy_app/widgets/categories_widget.dart';
import 'package:ecommer_easy_app/widgets/custom_drawar_widgets.dart';
import 'package:ecommer_easy_app/widgets/flash_sale_widget.dart';
import 'package:ecommer_easy_app/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../auth/login_screen.dart';
import '../../../widgets/all_products_widget.dart';
import '../allCategoryScreen/all_category_screen.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10.h),
              //   child: BannerWidget(),
              // ),
              SizedBox(height: 20.h),
              HeadingWidget(
                title: 'Categore',
                subTitle: 'According to your buget',
                buttonString: 'Show more >',
                onTap: () {
                  Get.to(AllCategoryScreen());
                },
              ),
              SizedBox(height: 10.h),
              CategoriesWidget(),
              SizedBox(height: 20.h),
              HeadingWidget(
                title: 'Flash Sale',
                subTitle: 'According to your buget',
                buttonString: 'Show more >',
                onTap: () {
                  Get.to(AllFlashSaleScreen());
                },
              ),
              SizedBox(height: 10.h),
              FlashSaleWidget(),
              SizedBox(height: 20.h),
              HeadingWidget(
                title: 'All Products',
                subTitle: 'According to your buget',
                buttonString: 'Show more >',
                onTap: () {
                  Get.to(AllProductsScreen());
                },
              ),
              SizedBox(height: 10.h),
              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

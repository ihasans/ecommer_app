import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommer_easy_app/models/categories_model.dart';
import 'package:ecommer_easy_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_card/image_card.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('All Cagetories'),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('categories').get(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              }

              if (snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No category found'));
              }
              if (snapshot.data != null) {
                return GridView.builder(
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // 👈 Prevents nested scroll issues
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    CategoriesModel categoriesModel = CategoriesModel(
                      categoryId: snapshot.data!.docs[index]['categoryId'],
                      categoryImg: snapshot.data!.docs[index]['categoryImage'],
                      categoryName: snapshot.data!.docs[index]['categoryName'],
                      createdAt: snapshot.data!.docs[index]['createAt'],
                      updatedAt: snapshot.data!.docs[index]['updateAt'],
                    );

                    return FillImageCard(
                      borderRadius: 20.r,
                      width: double.infinity,
                      heightImage: 70.h,
                      imageProvider: CachedNetworkImageProvider(
                        categoriesModel.categoryImg,
                      ),
                      tags: [],
                      title: Center(child: Text(categoriesModel.categoryName)),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

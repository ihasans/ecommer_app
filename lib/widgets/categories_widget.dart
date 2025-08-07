import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommer_easy_app/models/categories_model.dart';
import 'package:ecommer_easy_app/screens/userPannel/singleCategoryProductScreen/single_category_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

// Fetch Data From FirebaseFirestore through Future Builder...........
class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
          return SizedBox(
            width: double.infinity,
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                CategoriesModel categoriesModel = CategoriesModel(
                  categoryId: snapshot.data!.docs[index]['categoryId'],
                  categoryImg: snapshot.data!.docs[index]['categoryImage'],
                  categoryName: snapshot.data!.docs[index]['categoryName'],
                  createdAt: snapshot.data!.docs[index]['createAt'],
                  updatedAt: snapshot.data!.docs[index]['updateAt'],
                );
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            SingleCategoryProductScreen(
                              categoryId:
                                  snapshot.data!.docs[index]['categoryId'],
                            ),
                          );
                        },
                        child: FillImageCard(
                          borderRadius: 20.r,
                          width: 100,
                          heightImage: 60.h,
                          imageProvider: CachedNetworkImageProvider(
                            categoriesModel.categoryImg,
                          ),
                          title: Center(
                            child: Text(categoriesModel.categoryName),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

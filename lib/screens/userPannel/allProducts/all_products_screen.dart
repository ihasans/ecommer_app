import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommer_easy_app/models/product_model.dart';
import 'package:ecommer_easy_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_card/image_card.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('All Product'),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('products').get(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              }

              if (snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No All Product found'));
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
                    childAspectRatio: 0.8.h,
                  ),
                  itemBuilder: (context, index) {
                    final productData = snapshot.data!.docs[index];
                    ProductModel productModel = ProductModel(
                      productId: productData['productId'],
                      categoryId: productData['categoryId'],
                      productName: productData['productName'],
                      categoryName: productData['categoryName'],
                      salePrice: productData['salePrice'],
                      fullPrice: productData['fullPrice'],
                      productImages: productData['productImage'],
                      deliveryTime: productData['deliveryTime'],
                      isSale: productData['isSale'],
                      productDescription: productData['productDescription'],
                      createdAt: productData['createAt'],
                      updatedAt: productData['updateAt'],
                    );

                    return GestureDetector(
                      onTap: () {},
                      child: FillImageCard(
                        borderRadius: 20.r,
                        width: double.infinity,
                        heightImage: 70.h,
                        imageProvider: CachedNetworkImageProvider(
                          productModel.productImages[0],
                        ),

                        title: Center(child: Text(productModel.productName)),
                        footer: Center(
                          child: Text('Rs: ${productModel.fullPrice}'),
                        ),
                      ),
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

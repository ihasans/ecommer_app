import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommer_easy_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_card/image_card.dart';

// Fetch Data From FirebaseFirestore through Future Builder...........
class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where('isSale', isEqualTo: true)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No product found'));
        }
        if (snapshot.data != null) {
          return SizedBox(
            width: double.infinity,
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                ProductModel productModel = ProductModel(
                  productId: snapshot.data!.docs[index]['productId'],
                  categoryId: snapshot.data!.docs[index]['categoryId'],
                  productName: snapshot.data!.docs[index]['productName'],
                  categoryName: snapshot.data!.docs[index]['categoryName'],
                  salePrice: snapshot.data!.docs[index]['salePrice'],
                  fullPrice: snapshot.data!.docs[index]['fullPrice'],
                  productImages: snapshot.data!.docs[index]['productImage'],
                  deliveryTime: snapshot.data!.docs[index]['deliveryTime'],
                  isSale: snapshot.data!.docs[index]['isSale'],
                  productDescription:
                      snapshot.data!.docs[index]['productDescription'],
                  createdAt: snapshot.data!.docs[index]['createAt'],
                  updatedAt: snapshot.data!.docs[index]['updateAt'],
                );
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: FillImageCard(
                        borderRadius: 20.r,
                        width: 120,
                        heightImage: 60.h,
                        imageProvider: CachedNetworkImageProvider(
                          productModel.productImages[0],
                        ),
                        tags: [],
                        title: Center(child: Text(productModel.productName)),
                        footer: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Rs ${productModel.fullPrice}')],
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

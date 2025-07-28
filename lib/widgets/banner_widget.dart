import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommer_easy_app/controllers/banner_controller.dart';
import 'package:ecommer_easy_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  BannerController bannerController = Get.put(BannerController());
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CarouselSlider(
        items: bannerController.bannerUrls
            .map(
              (imageUrls) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrls,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => ColoredBox(
                      color: Colors.white,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: AppConstant.appMainColor,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          aspectRatio: 2.5.r,
        ),
      ),
    );
  }
}

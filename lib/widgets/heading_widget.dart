import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_constant.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonString;
  final Function() onTap;
  const HeadingWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonString,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppConstant.subTitleText),
                Text(subTitle, style: AppConstant.subTitleText2),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 90.w,
                height: 30.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppConstant.appMainColor,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(buttonString, style: AppConstant.subTitleText3),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

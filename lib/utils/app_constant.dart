import 'package:flutter/material.dart';

class AppConstant {
  static String appMainName = 'Ecomrance';
  static String appPowerBy = 'Powerd by Shah Brothers';
  static const appMainColor = Color(0xff319794);
  static const appSecondoryColor = Color(0xffB3B3B3);
  static const appTextColor = Colors.white;
  static const appStatusBarColor = Colors.black;

  static const header1Text = TextStyle(
    fontSize: 25,
    color: appTextColor,
    fontWeight: FontWeight.w600,
  );
  static const buttonText = TextStyle(
    fontSize: 16,
    color: appTextColor,
    fontWeight: FontWeight.w600,
  );
  static const subTitleText = TextStyle(
    fontSize: 16,
    color: appStatusBarColor,
    fontWeight: FontWeight.w400,
  );
  static const subTitleText2 = TextStyle(
    fontSize: 14,
    color: appSecondoryColor,
    fontWeight: FontWeight.w400,
  );
  static const subTitleText3 = TextStyle(
    fontSize: 14,
    color: appMainColor,
    fontWeight: FontWeight.w400,
  );
}

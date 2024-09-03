import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class AppTextStyle {
  // ignore: constant_identifier_names
  static const greysmall = TextStyle(color: AppColors.grey, fontSize: 14);
  static const warninrred = TextStyle(color: AppColors.red, fontSize: 14);

  static const main = TextStyle(color: AppColors.main, fontSize: 16);
  static const mainwhite = TextStyle(color: AppColors.white, fontSize: 16);
  static const mainred = TextStyle(color: AppColors.red, fontSize: 16);

  static const mainbold = TextStyle(
      color: AppColors.main, fontSize: 16, fontWeight: FontWeight.bold);
}

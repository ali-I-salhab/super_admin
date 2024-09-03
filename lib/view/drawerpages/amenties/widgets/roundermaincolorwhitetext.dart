import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';

class RoundedText extends StatelessWidget {
  final String text;
  final double? padver;
  final double? padhor;

  RoundedText({
    super.key,
    required this.text,
    this.padver,
    this.padhor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        padding: EdgeInsets.symmetric(
            horizontal: padhor ?? 5.sp, vertical: padver ?? 4.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.main,
        ),
        child: Text(
          '$text',
          style: AppTextStyle.mainwhite,
        ));
  }
}

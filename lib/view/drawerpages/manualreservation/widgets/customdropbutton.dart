import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomDropButton extends StatelessWidget {
  final String text;
  const CustomDropButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.sp),
      padding: EdgeInsets.all(3.sp),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.main),
          borderRadius: BorderRadius.circular(12.sp)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.sp),
            padding: EdgeInsets.all(1.sp),
            decoration:
                BoxDecoration(color: AppColors.main, shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 10.sp,
            ),
          ),
          Text(
            "$text ",
            style: TextStyle(color: AppColors.main, fontSize: 9.sp),
          )
        ],
      ),
    );
  }
}

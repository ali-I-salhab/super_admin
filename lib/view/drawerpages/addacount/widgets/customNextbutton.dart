import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomNextButton extends StatelessWidget {
  final void Function()? ontap;

  const CustomNextButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 12.sp),
        child: Text(
          'Next',
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: AppColors.main, borderRadius: BorderRadius.circular(12.sp)),
      ),
    );
  }
}

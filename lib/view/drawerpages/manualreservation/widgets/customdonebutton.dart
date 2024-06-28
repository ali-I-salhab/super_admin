import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';

class DoneButton extends StatelessWidget {
  final void Function() ontap;

  DoneButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
        decoration: BoxDecoration(
            color: AppColors.main, borderRadius: BorderRadius.circular(8.sp)),
        child: Text(
          'Done',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

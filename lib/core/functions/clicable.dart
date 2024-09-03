import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class Clicable extends StatelessWidget {
  VoidCallback ontap;
  final Widget child;
  Clicable({super.key, required this.child, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("object");
        ontap();
      },
      borderRadius: BorderRadius.circular(12.sp),
      splashColor: AppColors.main,
      splashFactory: InkSplash.splashFactory,
      child: child,
    );
  }
}

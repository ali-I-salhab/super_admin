import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomClips extends StatelessWidget {
  final String name;
  final IconData? icon;
  final String? iconasString;
  const CustomClips(
      {super.key, required this.name, this.icon, this.iconasString});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 1.sp),
      backgroundColor: Colors.white,
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.sp),
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.black38,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 1))
            ]),
        height: 30.sp,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: AppColors.main,
                  )
                : iconasString != null
                    ? Iconify(iconasString!)
                    : Text('null object'),
            Text(
              ' $name',
              style: TextStyle(color: AppColors.main),
            ),
          ],
        ),
      ),
    );
  }
}

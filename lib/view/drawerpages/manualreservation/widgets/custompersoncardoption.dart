import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomPersonCard extends StatelessWidget {
  final String name;
  final String icon;
  final String number;

  const CustomPersonCard(
      {super.key,
      required this.name,
      required this.number,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.all(2.sp),
              decoration:
                  BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
              child: Iconify(
                icon,
                size: 16.sp,
              )),
          Text(
            " $number $name",
            style: TextStyle(color: AppColors.main, fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}

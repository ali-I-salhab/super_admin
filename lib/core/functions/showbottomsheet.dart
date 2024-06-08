import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

showbottomsheet(ontapgallery, ontapcamera) {
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
        color: AppColors.black, borderRadius: BorderRadius.circular(20)),
    height: 10.h,
    margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: ontapcamera,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                Text("Camera",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          InkWell(
            onTap: ontapgallery,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Ionicons.image,
                  color: Colors.white,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}

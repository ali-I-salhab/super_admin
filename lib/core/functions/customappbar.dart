import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget customappbar() {
  return PreferredSize(
      preferredSize: Size(100.w, 25.h),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            child: UnconstrainedBox(
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25.sp,
                          color: Colors.black,
                        )),
                    Image.asset(ImageAssets.homelogo),
                    Badge(
                      offset: Offset(-9.w, 2.h),
                      label: Text("22"),
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.notifications);
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 30.sp,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
}

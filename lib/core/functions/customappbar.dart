import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget customappbar(GlobalKey<SliderDrawerWidgetState> drawerKey) {
  return PreferredSize(
      preferredSize: Size(100.w, 25.h),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            child: UnconstrainedBox(
              child: Container(
                margin: EdgeInsets.all(10.sp),
                width: 90.w,
                height: 7.h,
                decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (drawerKey.currentState != null) {
                            drawerKey.currentState!.toggleDrawer();
                          } else {
                            print(drawerKey);
                          }
                        },
                        icon: Icon(
                          Icons.list,
                          size: 25.sp,
                          color: Colors.white,
                        )),
                    ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          ImageAssets.profile,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
}

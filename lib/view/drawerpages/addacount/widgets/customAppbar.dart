import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/view/appIcons.dart';

PreferredSizeWidget? CustomizableAppBar(
    {void Function()? ontapaction,
    String? title,
    isactioned = true,
    bool isnotifications = false}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    leadingWidth: 60.sp,
    leading: UnconstrainedBox(
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 30.sp,
          width: 30.sp,
          decoration:
              BoxDecoration(color: AppColors.main, shape: BoxShape.circle),
          child: Icon(Icons.arrow_back),
        ),
      ),
    ),
    actions: isactioned
        ? [
            UnconstrainedBox(
              child: InkWell(
                onTap: ontapaction,
                child: Container(
                  width: 30.sp,
                  height: 30.sp,
                  margin: EdgeInsets.only(right: 12.sp, top: 3.sp),
                  decoration: BoxDecoration(
                      color: AppColors.main,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Transform.translate(
                    offset: Offset(0, -3.5),
                    child: Center(
                      child: Transform.rotate(
                        angle: !isnotifications ? -pi / 2 : 0,
                        child: !isnotifications
                            ? Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )
                            : Center(
                                child: Transform.translate(
                                    offset: Offset(0, 2),
                                    child: Iconify(AppIcons.notificatons))),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]
        : [Container()],
    title: Text(
      title!,
      style: TextStyle(color: Colors.black),
    ),
  );
}

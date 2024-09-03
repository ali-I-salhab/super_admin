import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/amenties/widgets/roundermaincolorwhitetext.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdonebutton.dart';

showsuccessdialogue() {
  return Get.defaultDialog(
      title: "Success",
      content: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Text(
            "Done !",
            style: TextStyle(color: AppColors.green),
          ),
          Text("Edit Succesfull"),
          SizedBox(
            height: 12.sp,
          ),
          DoneButton(
            ontap: () {},
            buttoncolor: AppColors.green,
          )
        ],
      ));
}

showuploaddialogue() {
  return Get.defaultDialog(
      title: "Upload files",
      content: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(color: AppColors.main, shape: BoxShape.rectangle),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.sp),
              padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 4.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.main,
              ),
              child: Text(
                'Upload files',
                style: AppTextStyle.mainwhite,
              )),
          Row(
            children: [
              Text(
                'icon color ',
                style: AppTextStyle.greysmall,
              ),
              RoundedText(
                text: '4533gdf',
              ),
              Text(
                '  Size 32 * 32',
                style: AppTextStyle.greysmall,
              ),
            ],
          )
        ],
      ));
}

showdeletedialogue([void Function()? onconfirm, String? title]) {
  return Get.defaultDialog(
      title: title ?? "Delete Icon",
      content: Column(
        children: [
          Iconify(AppIcons.sadface),
          Text("Are you sure Delete"),
          SizedBox(
            height: 12.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Clicable(
                ontap: () {
                  Get.back(canPop: false);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 7.sp, vertical: 4.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.red),
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Text(
                    "Cancel",
                    style: AppTextStyle.warninrred,
                  ),
                ),
              ),
              SizedBox(
                height: 12.sp,
              ),
              Clicable(
                ontap: () {
                  onconfirm!();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 7.sp, vertical: 4.sp),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Text(
                    "Delete",
                    style: AppTextStyle.mainwhite,
                  ),
                ),
              )
            ],
          )
        ],
      ));
}

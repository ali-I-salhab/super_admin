import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class MinimumCommissions extends StatelessWidget {
  const MinimumCommissions({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          CustomizableAppBar(title: 'Minimum Commissions', isactioned: false),
      body: Container(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Container(
              alignment: Alignment.center,
              child: CutomStepper(
                steps: 4,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              height: 15.h,
              width: 90.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.main,
                  ),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "B2B Minimum\n Commissions",
                    style: TextStyle(color: AppColors.main),
                  ),
                  Row(
                    children: [
                      GetBuilder<AddHotelAccountController>(
                          builder: (controller) {
                        return Container(
                          margin: EdgeInsets.only(right: 12.sp),
                          padding: EdgeInsets.all(4.sp),
                          decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Text(
                            controller.b2b!.text + " %",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                      Clicable(
                          ontap: () {
                            Get.defaultDialog(
                                title: "B2B minimum Commissions",
                                content: Container(
                                  width: 20.w,
                                  child: TextField(
                                    controller: controller.b2b,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.main),
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                        suffixIcon: Icon(Icons.percent)),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                onCancel: () {
                                  Get.back();
                                },
                                onConfirm: () {
                                  Get.back();
                                  controller.update();
                                });
                          },
                          child: Iconify(AppIcons.edit))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              height: 15.h,
              width: 90.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.main,
                ),
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "B2C Minimum\n Commissions",
                    style: TextStyle(color: AppColors.main),
                  ),
                  Row(
                    children: [
                      GetBuilder<AddHotelAccountController>(
                          builder: (controller) {
                        return Container(
                          margin: EdgeInsets.only(right: 12.sp),
                          padding: EdgeInsets.all(4.sp),
                          decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Text(
                            controller.b2c!.text + " %",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                      Clicable(
                          ontap: () {
                            Get.defaultDialog(
                                title: "B2C minimum Commissions",
                                content: Container(
                                  width: 20.w,
                                  child: TextField(
                                    controller: controller.b2c,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.main),
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                        suffixIcon: Icon(Icons.percent)),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                onCancel: () {
                                  Get.back();
                                },
                                onConfirm: () {
                                  Get.back();
                                  controller.update();
                                });
                          },
                          child: Iconify(AppIcons.edit))
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                controller.save_minimumcommision_data();
                Get.toNamed(AppRoutes.payment);
              },
            ),
          ],
        ),
      ),
    );
  }
}

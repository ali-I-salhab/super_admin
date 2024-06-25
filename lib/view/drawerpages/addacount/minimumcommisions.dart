import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class MinimumCommissions extends StatelessWidget {
  const MinimumCommissions({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Container(
                        margin: EdgeInsets.only(right: 12.sp),
                        padding: EdgeInsets.all(4.sp),
                        decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: Text(
                          '15%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Iconify(AppIcons.edit)
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
                      Container(
                        margin: EdgeInsets.only(right: 12.sp),
                        padding: EdgeInsets.all(4.sp),
                        decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: Text(
                          '15%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Iconify(AppIcons.edit)
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                Get.toNamed(AppRoutes.payment);
              },
            ),
          ],
        ),
      ),
    );
  }
}

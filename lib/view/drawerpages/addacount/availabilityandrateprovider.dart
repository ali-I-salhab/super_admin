import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customCheckbox.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class AvailabilityAndRateProvider extends StatelessWidget {
  const AvailabilityAndRateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(
          title: 'Availability And Rate Provider', isactioned: false),
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
                steps: 3,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              children: [
                Text("Choose one from This"),
              ],
            ),
            CustomCheckBox(
              value: false,
              conent: 'Manually by Account Admin',
            ),
            CustomCheckBox(
              value: false,
              conent: 'Manually by Travky Admin',
            ),
            CustomCheckBox(
              isactive: false,
              value: false,
              conent: 'Travky Chanel Manager (soon)',
            ),
            CustomCheckBox(
              isactive: false,
              value: false,
              conent: 'Chanel Manager (soon)',
            ),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                Get.toNamed(AppRoutes.MinimumCommissions);
              },
            ),
          ],
        ),
      ),
    );
  }
}

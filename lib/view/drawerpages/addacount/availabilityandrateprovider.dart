import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customCheckbox.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class AvailabilityAndRateProvider extends StatelessWidget {
  const AvailabilityAndRateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();

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
            Obx(() => Column(children: [
                  CustomCheckBox(
                    value: controller.availabilityandrateprovider.value == "AA"
                        ? true
                        : false,
                    conent: 'Manually by Account Admin',
                    oncjhanged: (v) {
                      controller.availabilityandrateprovider.value = 'aa';
                    },
                  ),
                  CustomCheckBox(
                    value: controller.availabilityandrateprovider.value == "ta"
                        ? true
                        : false,
                    conent: 'Manually by Travky Admin',
                    oncjhanged: (v) {
                      controller.availabilityandrateprovider.value = 'ta';
                    },
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
                ])),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                controller.save_availability_rate_provider_data();
                Get.toNamed(AppRoutes.MinimumCommissions);
              },
            ),
          ],
        ),
      ),
    );
  }
}

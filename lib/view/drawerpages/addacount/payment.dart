import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/paymentcartcheckbox.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(title: 'Payment', isactioned: false),
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
            Row(
              children: [
                Text('Payment Options'),
              ],
            ),
            Obx(
              () => Column(
                children: [
                  PaymentCheckBox(
                    onchange: (v) {
                      controller.activepayment.value = 'hpg';
                    },
                    title: 'Hotel Payment Gateway',
                    val: controller.activepayment.value == 'hpg' ? true : false,
                  ),
                  PaymentCheckBox(
                    onchange: (v) {
                      print(v);
                      controller.activepayment.value = 'tppg';
                    },
                    title: 'Travky partner Payment Gateway',
                    val:
                        controller.activepayment.value == 'tppg' ? true : false,
                  ),
                  PaymentCheckBox(
                    onchange: (v) {
                      print(v);
                      controller.activepayment.value = 'tgpg';
                    },
                    title: 'Travky Gartner Payment Gateway',
                    val:
                        controller.activepayment.value == 'tgpg' ? true : false,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                controller.save_payment_data();
                Get.toNamed(AppRoutes.ContractAttachment);
              },
            ),
          ],
        ),
      ),
    );
  }
}

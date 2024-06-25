import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/paymentcartcheckbox.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
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
            PaymentCheckBox(
              title: 'Hotel Payment Gateway',
              val: false,
            ),
            PaymentCheckBox(
              title: 'Travky partner Payment Gateway',
              val: false,
            ),
            PaymentCheckBox(
              title: 'Travky Gartner Payment Gateway',
              val: false,
            ),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                Get.toNamed(AppRoutes.ContractAttachment);
              },
            ),
          ],
        ),
      ),
    );
  }
}

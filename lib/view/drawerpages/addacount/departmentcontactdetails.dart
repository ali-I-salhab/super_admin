import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addaccontcontroller.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customHotelfromfield.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customizedformfield.dart';
import 'package:super_admin/view/widgets/auth/customtextformfield.dart';

class DepartmentContactDetails extends StatelessWidget {
  const DepartmentContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomizableAppBar(
            title: 'Department Contact Details', isactioned: false),
        body: Container(
          padding: EdgeInsets.all(12.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CutomStepper(
                    steps: 2,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  children: [
                    Text("Reservation"),
                  ],
                ),
                CustomTextformfieldAddAccount(
                  islabel: false,
                  title: 'phone',
                  hint: 'phone',
                  isphone: true,
                  mycontroller: controller.reservationphone,
                ),
                CustomTextformfieldAddAccount(
                  islabel: false,
                  mycontroller: controller.reservationemail,
                  title: 'Email',
                  hint: 'Email',
                ),
                Row(
                  children: [
                    Text("sales"),
                  ],
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.salesphone,
                  islabel: false,
                  title: 'phone',
                  hint: 'phone',
                  isphone: true,
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.salesemail,
                  islabel: false,
                  title: 'Email',
                  hint: 'Email',
                ),
                Row(
                  children: [
                    Text("Accounting"),
                  ],
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.accountingphonr,
                  islabel: false,
                  title: 'phone',
                  hint: 'phone',
                  isphone: true,
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.accountingemail,
                  islabel: false,
                  title: 'Email',
                  hint: 'Email',
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomNextButton(
                  ontap: () {
                    controller.departmentContactdetails_save_data_next_button();
                    Get.toNamed(AppRoutes.AvailabilityAndRateProvider);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

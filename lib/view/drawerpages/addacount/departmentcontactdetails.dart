import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomizableAppBar(
            title: 'Department Contact Details', isactioned: false),
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
              ),
              CustomTextformfieldAddAccount(
                islabel: false,
                title: 'Email',
                hint: 'Email',
              ),
              Row(
                children: [
                  Text("sales"),
                ],
              ),
              CustomTextformfieldAddAccount(
                islabel: false,
                title: 'phone',
                hint: 'phone',
              ),
              CustomTextformfieldAddAccount(
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
                islabel: false,
                title: 'phone',
                hint: 'phone',
              ),
              CustomTextformfieldAddAccount(
                islabel: false,
                title: 'Email',
                hint: 'Email',
              ),
              SizedBox(
                height: 20.sp,
              ),
              CustomNextButton(
                ontap: () {
                  Get.toNamed(AppRoutes.AvailabilityAndRateProvider);
                },
              ),
            ],
          ),
        ));
  }
}

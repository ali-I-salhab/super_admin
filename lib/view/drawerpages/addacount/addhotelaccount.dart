import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/auth/widgets/customSwitchslider.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customHotelfromfield.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:super_admin/view/widgets/auth/authtextformfield.dart';

class AddHotelAccount extends StatelessWidget {
  const AddHotelAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(title: 'Add Hotel Account', isactioned: false),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.sp,
              ),
              SlideSwitcher(
                first: 'Manually',
                second: 'Requested',
              ),
              SizedBox(
                height: 15.sp,
              ),
              Container(
                alignment: Alignment.center,
                child: CutomStepper(
                  steps: 1,
                ),
              ),
              SizedBox(
                height: 12.sp,
              ),
              CustomTextformfieldAddAccount(
                title: 'Hotel name',
                hint: 'Hotel name',
              ),
              CustomTextformfieldAddAccount(
                title: 'Hotel Country',
                hint: 'Hotel Country',
              ),
              CustomTextformfieldAddAccount(
                title: 'Hotel City',
                hint: 'Hotel City',
              ),
              CustomTextformfieldAddAccount(
                title: 'Phone number',
                hint: 'Phone number',
              ),
              CustomTextformfieldAddAccount(
                title: 'Google Review Nuber',
                hint: 'Googlr review number',
              ),
              CustomTextformfieldAddAccount(
                title: 'WebSite',
                hint: 'Website',
              ),
              CustomTextformfieldAddAccount(
                title: 'Email',
                hint: 'Email',
              ),
              CustomTextformfieldAddAccount(
                title: 'Facebook Account',
                hint: 'Facebook Account',
              ),
              CustomTextformfieldAddAccount(
                title: 'Vertical Line',
                hint: 'Facebook Account',
              ),
              CustomTextformfieldAddAccount(
                title: 'Horizontal Line',
                hint: 'Horizontal line',
              ),
              Row(
                children: [
                  Text(
                    ' Images',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Container(
                height: 10.h,
                width: 80.w,
                margin: EdgeInsets.only(top: 10.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.black26,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Iconify(AppIcons.Upload),
                    Text(
                      'upload files',
                      style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                    )
                  ],
                )),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                'Only jpg/png files can be uploaded and no more than 500kb',
                style: TextStyle(color: Colors.grey, fontSize: 10.sp),
              ),
              SizedBox(
                height: 20.sp,
              ),
              CustomNextButton(
                ontap: () {
                  Get.toNamed(AppRoutes.departmentcontactdetials);
                },
              ),
              SizedBox(
                height: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customHotelfromfield.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class AccountApproval extends StatelessWidget {
  const AccountApproval({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(title: 'Account Approval', isactioned: false),
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
                  steps: 8,
                ),
              ),
              SizedBox(
                height: 40.sp,
              ),
              Iconify(
                AppIcons.Accountapprove,
                size: 120.sp,
              ),
              SizedBox(
                height: 40.sp,
              ),
              CustomTextformfieldAddAccount(
                title: 'user name',
                hint: '',
                mycontroller: controller.username,
              ),
              CustomTextformfieldAddAccount(
                title: 'password',
                hint: '',
                mycontroller: controller.password,
              ),
              SizedBox(
                height: 10.h,
              ),
              Clicable(
                ontap: () async {
                  controller.save_account_approval();
                  print('uploading files function');
                  Get.defaultDialog(
                      barrierDismissible: false,
                      title: "processing",
                      content: Container(
                        width: 20.sp,
                        height: 20.sp,
                        child: CircularProgressIndicator(),
                      ));
                  await controller
                      .updatehoteldata(controller.hotel!.id.toString());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.sp, vertical: 12.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      border: Border.all(color: AppColors.main)),
                  child: Text(
                    'Send',
                    style: TextStyle(color: AppColors.main),
                  ),
                ),
              )
              // GetBuilder<AddHotelAccountController>(builder: (controller) {
              //   return Handlingdataview(
              //       statusrequest: controller.statusrequest,
              //       widget: Clicable(
              //         ontap: () async {
              //           controller.save_account_approval();
              //           await controller
              //               .updatehoteldata(controller.hotel!.id.toString());
              //         },
              //         child: Container(
              //           padding: EdgeInsets.symmetric(
              //               horizontal: 30.sp, vertical: 12.sp),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(12.sp),
              //               border: Border.all(color: AppColors.main)),
              //           child: Text(
              //             'Send',
              //             style: TextStyle(color: AppColors.main),
              //           ),
              //         ),
              //       ));
              // })
            ],
          ),
        ),
      ),
    );
  }
}

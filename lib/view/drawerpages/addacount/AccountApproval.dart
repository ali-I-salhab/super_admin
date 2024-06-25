import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customHotelfromfield.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class AccountApproval extends StatelessWidget {
  const AccountApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(title: 'Account Approval', isactioned: false),
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
            CustomTextformfieldAddAccount(title: 'user name', hint: ''),
            CustomTextformfieldAddAccount(title: 'password', hint: ''),
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: AppColors.main)),
              child: Text(
                'Send',
                style: TextStyle(color: AppColors.main),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';

class ContractAttachment extends StatelessWidget {
  const ContractAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          CustomizableAppBar(title: 'Contract Attachment', isactioned: false),
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
              height: 40.sp,
            ),
            Row(
              children: [Text('Attach the contract')],
            ),
            SizedBox(
              height: 40.sp,
            ),
            Column(
              children: [
                Iconify(
                  AppIcons.pdfone,
                  size: 40.sp,
                ),
                Text(
                  'Upload pdf file ',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Text(
              'Only PDF files can be uploaded and no more than 500kb',
              style: TextStyle(color: Colors.grey, fontSize: 8.sp),
            ),
            SizedBox(
              height: 40.sp,
            ),
            Row(
              children: [Text('Uploaded Files')],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              children: [
                Iconify(
                  AppIcons.pdftwo,
                  size: 30.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "100%",
                          style: TextStyle(color: Colors.grey, fontSize: 8.sp),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.sp),
                      color: Colors.red,
                      width: 60.w,
                      height: 3.sp,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Iconify(AppIcons.checkboxtrue),
                    Iconify(
                      AppIcons.roundedarrow,
                      size: 14.sp,
                    ),
                    SizedBox(
                      width: 7.sp,
                    ),
                    Iconify(
                      AppIcons.recyclebin,
                      size: 14.sp,
                    )
                  ],
                )
              ],
            ),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                // Get.toNamed(AppRoutes.AccountApproval);
              },
            ),
          ],
        ),
      ),
    );
  }
}

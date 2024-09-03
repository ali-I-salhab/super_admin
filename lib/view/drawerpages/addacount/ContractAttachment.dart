import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/core/functions/uploadfile.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/amenties/functions/dialogus.dart';
import 'package:path/path.dart' as p;

class ContractAttachment extends StatelessWidget {
  const ContractAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();
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
            Clicable(
              ontap: () async {
                controller.contract_attachement = await uploadexcelfile();
                if (controller.contract_attachement != null &&
                    p.extension(
                            controller.contract_attachement!.path.toString()) !=
                        '.pdf') {
                  Get.snackbar('warning',
                      'Can upload file with extention ${p.extension(controller.contract_attachement!.path.toString())}');
                }
                if ((controller.contract_attachement != null &&
                    p.extension(
                            controller.contract_attachement!.path.toString()) ==
                        '.pdf')) {
                  controller.contract_attachement_files!
                      .add(controller.contract_attachement!);
                  controller.update();
                }
              },
              child: controller.contract_attachement == null
                  ? Column(
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
                    )
                  : Column(
                      children: [
                        Iconify(
                          AppIcons.pdftwo,
                          size: 40.sp,
                        ),
                        Text(
                          p.basename(
                              controller.contract_attachement!.path.toString()),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
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
            GetBuilder<AddHotelAccountController>(builder: (controller) {
              return Expanded(
                  child: Column(
                children: [
                  ...List.generate(
                      controller.hotel!.contractAttachment!.length,
                      (index) => UploadedPdfFiles(
                          ondelete: () {
                            showdeletedialogue(() async {
                              controller.deletefile(
                                  controller
                                      .hotel!.contractAttachment![index].id
                                      .toString(),
                                  controller.hotel!.id.toString());
                            }, 'Delete This File');
                          },
                          filename: p.basename(controller
                              .hotel!.contractAttachment![index].file
                              .toString())))
                ],
              ));
            }),
            Expanded(child: Container()),
            CustomNextButton(
              ontap: () {
                controller.isloading.value = false;
                if (controller.contract_attachement != null) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (w) {
                        return StatefulBuilder(builder: (context, setstate) {
                          return UnconstrainedBox(
                            child: Material(
                              child: Container(
                                height: 20.h,
                                width: 80.w,
                                child: Obx(() => !controller.isloading.value
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("save uploading file "),
                                              Text(
                                                p.basename(controller
                                                    .contract_attachement!
                                                    .path),
                                                style: AppTextStyle.greysmall,
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Clicable(
                                                  child: Text("cancel"),
                                                  ontap: () {
                                                    Get.back();
                                                  }),
                                              Clicable(
                                                  child: Text("discard"),
                                                  ontap: () {
                                                    controller
                                                        .contract_attachement_files!
                                                        .clear();
                                                    controller.update();
                                                    Get.back();
                                                  }),
                                              Clicable(
                                                  child: Text("save"),
                                                  ontap: () {
                                                    controller.isloading.value =
                                                        true;

                                                    controller.uploadpdffiles(
                                                        controller
                                                            .contract_attachement_files);
                                                  })
                                            ],
                                          )
                                        ],
                                      )
                                    : Clicable(
                                        ontap: () {
                                          controller.isloading.value = true;
                                        },
                                        child: UnconstrainedBox(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Uploading files......  "),
                                            CircularProgressIndicator(
                                              color: AppColors.main,
                                            ),
                                          ],
                                        )))),
                              ),
                            ),
                          );
                        });
                      });
                } else {
                  Get.toNamed(AppRoutes.AccountApproval);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UploadedPdfFiles extends StatelessWidget {
  final VoidCallback ondelete;
  final String filename;
  const UploadedPdfFiles({
    super.key,
    required this.ondelete,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.sp),
      child: Row(
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
                    "$filename 100%",
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
              Clicable(
                ontap: () {
                  ondelete!();
                },
                child: Iconify(
                  AppIcons.recyclebin,
                  size: 14.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

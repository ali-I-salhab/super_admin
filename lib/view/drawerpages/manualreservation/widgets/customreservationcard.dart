import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/core/functions/customcollectdialogue.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdonebutton.dart';

class CustomReservationCard extends StatelessWidget {
  final int step;
  final void Function() ontap;
  const CustomReservationCard({
    super.key,
    required this.step,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.sp), boxShadow: [
        BoxShadow(
            color: Colors.black38,
            spreadRadius: 2,
            blurStyle: BlurStyle.outer,
            blurRadius: 2)
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hotel name"),
                  Text(
                    "ID #11226Tr",
                    style: TextStyle(color: AppColors.grey),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Text(
                'Show Details',
                style: TextStyle(color: AppColors.main),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4.sp),
            alignment: Alignment.center,
            child: CutomStepper(
              steps: step,
            ),
          ),
          Divider(
            color: AppColors.greyfat.withOpacity(0.6),
            thickness: 3.sp,
          ),
          Row(
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
                width: 40.sp,
                height: 40.sp,
                color: Colors.red,
              ),
              SizedBox(
                width: 30.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hotel name',
                    style: TextStyle(color: AppColors.main),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'From ',
                      style: AppTextStyle.greysmall,
                      children: const <TextSpan>[
                        TextSpan(text: '20/4/2024', style: AppTextStyle.main),
                        TextSpan(text: ' to ', style: AppTextStyle.greysmall),
                        TextSpan(text: '20/6/2024', style: AppTextStyle.main),
                      ],
                    ),
                  ),
                  Text(
                    '3 Nights',
                    style: AppTextStyle.greysmall,
                  ),
                  Text(
                    '4 rsooms',
                    style: TextStyle(color: AppColors.grey),
                  ),
                  step == 2
                      ? Text(
                          'Status : requested',
                          style: TextStyle(color: AppColors.grey),
                        )
                      : step == 3
                          ? Text(
                              'Status : waiting',
                              style: TextStyle(color: AppColors.grey),
                            )
                          : step == 4
                              ? Text(
                                  'Status : Confirmed',
                                  style: TextStyle(color: AppColors.grey),
                                )
                              : step == 5
                                  ? Text(
                                      'Status : Collected',
                                      style: TextStyle(color: AppColors.grey),
                                    )
                                  : step == 6
                                      ? Container(
                                          width: 55.w,
                                          child: FittedBox(
                                            child: Text(
                                              'Status : collection not confirmed',
                                              style: TextStyle(
                                                  color: AppColors.red),
                                            ),
                                          ),
                                        )
                                      : step == 7
                                          ? Text(
                                              'Status : Confirmed collection',
                                              style: TextStyle(
                                                  color: AppColors.grey),
                                            )
                                          : Text(
                                              'Status : confirmed collection',
                                              style: TextStyle(
                                                  color: AppColors.grey),
                                            ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              step == 2
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.sp),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius: BorderRadius.circular(12.sp)),
                      child: Text(
                        r"200$",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : step == 3
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(12.sp)),
                          child: Text(
                            r"200$",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : step == 4
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.sp),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp, vertical: 5.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(12.sp)),
                              child: Text(
                                r"200$",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : step == 5
                              ? Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.sp, vertical: 5.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.main,
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Text(
                                    r"200$",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : step == 6
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5.sp),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.sp, vertical: 5.sp),
                                      decoration: BoxDecoration(
                                          color: AppColors.green,
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Text(
                                        r"200$",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                  : step == 7
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.sp),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.sp,
                                              vertical: 5.sp),
                                          decoration: BoxDecoration(
                                              color: AppColors.main,
                                              borderRadius:
                                                  BorderRadius.circular(12.sp)),
                                          child: Text(
                                            r"Net rate 200$",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                      : Container(),
              InkWell(
                onTap: ontap,
                child: step == 2
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 5.sp),
                        decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(12.sp)),
                        child: Text(
                          r"Send Request",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : step == 3
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.sp),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.sp, vertical: 5.sp),
                            decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(12.sp)),
                            child: Text(
                              r"Waiting hotel cofirmation",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : step == 4
                            ? Clicable(
                                ontap: () {
                                  print('s');
                                  collectdialogue(title: 'Collect');
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.sp, vertical: 5.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_box_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        " collect",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : step == 5
                                ? Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.sp),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.sp, vertical: 5.sp),
                                        decoration: BoxDecoration(
                                            color: AppColors.main,
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_box_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Confirm collection",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  )
                                : step == 6
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.sp),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.sp, vertical: 5.sp),
                                        decoration: BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_box_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              " collect",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    : step == 7
                                        ? Clicable(
                                            ontap: () {
                                              collectdialogue(
                                                  title: 'Pay out Collect');
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.sp),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.sp,
                                                  vertical: 5.sp),
                                              decoration: BoxDecoration(
                                                  color: AppColors.main,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.sp)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    " Pay out",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.sp),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12.sp,
                                                    vertical: 5.sp),
                                                decoration: BoxDecoration(
                                                    color: AppColors.main,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.sp)),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Booking Details",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              ),
                                            ],
                                          ),
              )
            ],
          )
        ],
      ),
    );
  }
}

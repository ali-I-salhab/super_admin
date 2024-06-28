import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdonebutton.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdropbutton.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customroomoptionscard.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/roomcard.dart';

class AddReservationRoomDetails extends StatefulWidget {
  const AddReservationRoomDetails({super.key});

  @override
  State<AddReservationRoomDetails> createState() =>
      _AddReservationRoomDetailsState();
}

class _AddReservationRoomDetailsState extends State<AddReservationRoomDetails> {
  @override
  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  Widget build(BuildContext context) {
    return SliderDrawerWidget(
      key: drawerKey,
      option: SliderDrawerOption(
        // backgroundImage: toggleBackgroundState
        // ? Image.asset("assets/sample_background.jpg")
        // : Image.asset("assets/sample_background2.jpg"),
        backgroundColor: AppColors.blue,
        sliderEffectType: SliderEffectType.Rounded,
        upDownScaleAmount: 30,
        radiusAmount: 40,
        direction: SliderDrawerDirection.LTR,
      ),
      drawer:
          Container(margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
      body: SafeArea(
        child: Scaffold(
          appBar: customappbar(drawerKey),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(bottom: 20.sp),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropButton(
                          text: 'Groups',
                        ),
                        CustomDropButton(
                          text: 'Meal Plans',
                        ),
                      ],
                    ),
                  ),
                  RoomCard(),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    margin: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.black26,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0.1, 1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(12.sp)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 4.sp),
                          child: Text(
                            r"130$",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),
                        Text(
                          "Meal Plan",
                          style: TextStyle(color: AppColors.main),
                        ),
                        CustomPersonCard(
                          number: '2',
                          name: 'Bed only',
                          icon: AppIcons.singlebed,
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),
                        Text(
                          "Guests",
                          style: TextStyle(color: AppColors.main),
                        ),
                        CustomPersonCard(
                          number: '2',
                          name: 'Bed only',
                          icon: AppIcons.singlebed,
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),
                        Text(
                          "Beds",
                          style: TextStyle(color: AppColors.main),
                        ),
                        CustomPersonCard(
                          number: '2',
                          name: 'Bed only',
                          icon: AppIcons.singlebed,
                        ),
                        CustomPersonCard(
                          number: '2',
                          name: 'Bed only',
                          icon: AppIcons.singlebed,
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),
                        Text(
                          "Refund Policy",
                          style: TextStyle(color: AppColors.main),
                        ),
                        Text(
                          r"Non Refundable (Save 14 $ More)",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          r"Free Cancelation till 7 days Before Check in ",
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          r"Free Cancelation till 24 hrs before check in ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp, vertical: 2.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.main,
                                  borderRadius: BorderRadius.circular(12.sp)),
                              child: Text(
                                r"Total:2 206$",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.main,
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(color: AppColors.main),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.main,
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  DoneButton(ontap: () {
                    Get.toNamed(AppRoutes.AddreservationBedOptions);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

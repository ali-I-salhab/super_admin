import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_clips.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdonebutton.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdropbutton.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customroomoptionscard.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/roomcard.dart';

class MainManualReservation extends StatefulWidget {
  const MainManualReservation({super.key});

  @override
  State<MainManualReservation> createState() =>
      _AddReservationRoomDetailsState();
}

class _AddReservationRoomDetailsState extends State<MainManualReservation> {
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
                      margin: EdgeInsets.all(12.sp),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomClips(
                              name: 'Hotels',
                              iconasString: AppIcons.hotel,
                            ),
                            CustomClips(
                              name: 'Activity',
                              iconasString: AppIcons.Activity,
                            ),
                            CustomClips(
                              name: 'Accounts',
                              iconasString: AppIcons.person,
                            ),
                            CustomClips(
                              name: 'Accounts',
                              iconasString: AppIcons.person,
                            ),
                            CustomClips(
                              name: 'Accounts',
                              iconasString: AppIcons.person,
                            ),
                            CustomClips(
                              name: 'Accounts',
                              iconasString: AppIcons.person,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 5.sp, vertical: 5.sp),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 2,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2)
                          ]),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.main, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Text('   Add New Manual Reservation')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Container(
                              padding: EdgeInsets.all(3.sp),
                              margin: EdgeInsets.only(right: 12.sp),
                              decoration: BoxDecoration(
                                color: AppColors.main,
                                shape: BoxShape.circle,
                              ),
                              child: Iconify(
                                AppIcons.equaltor,
                                size: 15.sp,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.sp))),
                      ),
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    Text('data')
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdropbutton.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customroomoptionscard.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/roomcard.dart';

class CompleteBooking extends StatefulWidget {
  const CompleteBooking({super.key});

  @override
  State<CompleteBooking> createState() => _AddReservationRoomDetailsState();
}

class _AddReservationRoomDetailsState extends State<CompleteBooking> {
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
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (c) {})
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

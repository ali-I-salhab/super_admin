import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
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
          body: Column(
            children: [
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
                        r"120$",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: AppColors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

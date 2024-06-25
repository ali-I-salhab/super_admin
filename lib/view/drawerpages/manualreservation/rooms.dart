import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdropbutton.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customroomoptionscard.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/roomcard.dart';

class AddReservationRooms extends StatefulWidget {
  const AddReservationRooms({super.key});

  @override
  State<AddReservationRooms> createState() => _AddReservationRoomsState();
}

class _AddReservationRoomsState extends State<AddReservationRooms> {
  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: AppColors.main));

    return SafeArea(
      child: SliderDrawerWidget(
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
        drawer: Container(
            margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
        body: Scaffold(
          appBar: customappbar(drawerKey),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: CutomStepper(
                  steps: 8,
                ),
              ),
              Row(
                children: [
                  Text(
                    "  Select Room",
                    style: TextStyle(color: AppColors.main, fontSize: 24.sp),
                  ),
                ],
              ),
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
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(2.sp),
                  // color: Colors.red,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.AddReservationRoomDetails);
                            },
                            child: RoomCard()),
                        RoomCard(),
                        RoomCard(),
                        RoomCard()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

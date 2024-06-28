import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_clips.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/hotelcard.dart';

class Addreservation extends StatefulWidget {
  const Addreservation({super.key});

  @override
  State<Addreservation> createState() => _AddreservationState();
}

class _AddreservationState extends State<Addreservation> {
  GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(drawerKey.currentState);
    print("---------------------");
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
      body: Scaffold(
        drawer: Container(
            margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
        backgroundColor: Colors.white,
        appBar:
            CustomizableAppBar(title: 'Add Reservation', isnotifications: true),
        body: Container(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              // Container(child: OpenContainer(),)
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
              TextFormField(
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
              SizedBox(
                height: 12.sp,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      5,
                      (index) => InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.AddReservationRooms);
                        },
                        child: HotelCard(
                          image: ImageAssets.profile,
                          name: 'Grand royal hotel',
                          location: 'syria',
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/arcticons.dart';
import 'package:iconify_flutter/icons/fa_solid.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/addedHotelcard.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_clips.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // <--- do not forget mark this as true
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.only(bottom: 12.sp),
          width: 50.w,
          height: 7.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.sp),
              color: AppColors.main),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Iconify(AppIcons.equaltor),
                  Container(
                    width: 15.w,
                    child: Text(
                      ' Country',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                width: 3.sp,
                height: 7.h,
                alignment: Alignment.center,
              ),
              Row(
                children: [
                  Iconify(AppIcons.equaltor),
                  Container(
                    width: 15.w,
                    child: Text(
                      ' City',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(
          title: "Add Account",
          ontapaction: () {
            showMenu(
                context: context,
                position: RelativeRect.fromLTRB(129, 10.h, 12, 12),
                items: [
                  PopupMenuItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.addhotelaccount);
                    },
                    child: Row(
                      children: [Icon(Icons.add), Text('New Account ')],
                    ),
                  ),
                  // PopupMenuItem(child: Text('ali'))
                ]);
          }),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideSwitcher(),
            ],
          ),
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
          Expanded(
            // height: 65.h,
            // padding: EdgeInsets.symmetric(horizontal: 4.sp),
            // margin: EdgeInsets.symmetric(vertical: 12.sp),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddedHotelCard(
                    image: ImageAssets.profile,
                    name: 'Hotel name',
                    location: 'Syria_tartous',
                  ),
                  AddedHotelCard(
                    image: ImageAssets.profile,
                    name: 'Hotel name',
                    location: 'Syria_tartous',
                  ),
                  AddedHotelCard(
                    image: ImageAssets.profile,
                    name: 'Hotel name',
                    location: 'Syria_tartous',
                  ),
                  AddedHotelCard(
                    image: ImageAssets.profile,
                    name: 'Hotel name',
                    location: 'Syria_tartous',
                  ),
                  AddedHotelCard(
                    image: ImageAssets.profile,
                    name: 'Hotel name',
                    location: 'Syria_tartous',
                  ),
                  AddedHotelCard(
                    image: ImageAssets.profile,
                    name: 'Hotel name',
                    location: 'Syria_tartous',
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

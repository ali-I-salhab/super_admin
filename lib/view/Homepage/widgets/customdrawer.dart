import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/hompage/homepagecontroller.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/data/model/me.dart';
import 'package:super_admin/view/Homepage/widgets/editprofile.dart';

class CustomDrawer extends StatelessWidget {
  final MeModel? me;
  CustomDrawer({Key? key, this.me}) : super(key: key);

  Widget _thumbnailPart() {
    MyServices serv = Get.find();
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(serv.shared.getString("accesstoken")!);

    return Row(
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: GetBuilder<HomePageController>(builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(ImageAssets.profile),
                    ),
                    Text(
                      me?.username ?? "null",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    Text(
                      me?.email.toString() ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    EditProfile()
                  ],
                );
              })),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _thumbnailPart(),
            MenuBox(
              onTap: () {
                Get.toNamed(AppRoutes.addaccount);
              },
              name: 'Accounts',
              icon: Icons.person_add_outlined,
            ),
            MenuBox(
              name: 'Users',
              icon: Icons.person_2_outlined,
            ),
            MenuBox(
              name: 'Email Forms',
              icon: Icons.email,
            ),
            MenuBox(
              onTap: () {
                Get.toNamed(AppRoutes.MainManualReservation);
              },
              name: 'Manual Rservation',
              icon: Icons.check_circle,
            ),
            MenuBox(
              name: 'charts',
              icon: Icons.arrow_back_ios,
            ),
            MenuBox(
              onTap: () {
                Get.toNamed(AppRoutes.MainAmenties);
              },
              name: 'Amenties',
              icon: Icons.arrow_back_ios,
            ),
            MenuBox(
              name: 'Minimum Commission',
              icon: Icons.arrow_back_ios,
            ),
            MenuBox(
              name: 'B2B Page',
              icon: Icons.description,
            ),
            MenuBox(
              name: 'B2C Page',
              icon: Icons.description,
            ),
            MenuBox(
              name: 'Channel Manager',
              icon: Icons.arrow_back_ios,
            ),
            // MenuBox(
            //   name: 'SubScribtion Account',

            // ),
          ],
        ),
      ),
    );
  }
}

class MenuBox extends StatelessWidget {
  final IconData icon;
  String? name;

  final Function()? onTap;
  MenuBox({
    this.name,
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        if (onTap != null) {
          this.onTap!();
        }
      },
      child: Container(
        // color: Colors.red,
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 12.sp),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
                Text(
                  name!,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Transform.rotate(
              angle: pi,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

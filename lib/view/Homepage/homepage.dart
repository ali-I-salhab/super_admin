import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/homepagecontroller.dart';
import 'package:super_admin/controller/hompage/homepagecontroller.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/Homepage/widgets/editprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  bool toggleBackgroundState = false;
  HomePageController controller = Get.put(HomePageController());

  void toggleBackgroundImage() {
    setState(() {
      toggleBackgroundState = !toggleBackgroundState;
    });
  }

  @override
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
        drawer: Container(
            margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
        body: SafeArea(
            child: Scaffold(
                body: Container(
                  color: Colors.red,
                  child: Text("home page"),
                ),
                appBar: customappbar(drawerKey),
                bottomNavigationBar: GetBuilder<HomePageController>(
                  builder: (controller) {
                    return Container(
                        height: 50.sp,
                        padding: EdgeInsets.symmetric(horizontal: 1.sp),
                        margin: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(40.sp),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 32.sp,
                                  offset: Offset(0, 10.sp))
                            ]),
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.currentindex = index;
                                  HapticFeedback.lightImpact();
                                  controller.update();
                                },
                                child: Container(
                                  child: Stack(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        width: controller.currentindex == index
                                            ? 75.sp
                                            : 10.sp,
                                        alignment: Alignment.center,
                                        child: AnimatedContainer(
                                          // alignment: Alignment.center,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          height:
                                              index == controller.currentindex
                                                  ? 35.sp
                                                  : 10.sp,
                                          width:
                                              index == controller.currentindex
                                                  ? 80.sp
                                                  : 8.sp,
                                          decoration: BoxDecoration(
                                              color: index ==
                                                      controller.currentindex
                                                  ? const Color.fromARGB(
                                                          255, 16, 16, 16)
                                                      .withOpacity(0.2)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(50.sp)),
                                        ),
                                      ),
                                      AnimatedContainer(
                                        // color: Colors.yellow,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        width: index == controller.currentindex
                                            ? 100.sp
                                            : 60.sp,
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            Row(
                                              children: [
                                                AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  width: index ==
                                                          controller
                                                              .currentindex
                                                      ? 30.sp
                                                      : 10.sp,
                                                ),
                                                AnimatedOpacity(
                                                  opacity: index ==
                                                          controller
                                                              .currentindex
                                                      ? 1
                                                      : 0,
                                                  duration:
                                                      Duration(seconds: 1),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  child: Text(
                                                    index ==
                                                            controller
                                                                .currentindex
                                                        ? listoftiles[index]
                                                        : '',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                AnimatedContainer(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  width: index ==
                                                          controller
                                                              .currentindex
                                                      ? 5.sp
                                                      : 8.sp,
                                                ),
                                                Icon(
                                                  listoficons[index],
                                                  size: 17.sp,
                                                  color: index ==
                                                          controller
                                                              .currentindex
                                                      ? Colors.white
                                                      : Colors.black26,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                  },
                ))));
  }
}

List<IconData> listoficons = [
  Icons.home,
  Icons.favorite_rounded,
  Icons.settings_rounded,
  Icons.person_rounded
];
List<String> listoftiles = ['Home ', 'Favorite ', 'Settings ', 'Account '];

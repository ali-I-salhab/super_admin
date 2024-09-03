import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/Apiapplink.dart';
import 'package:super_admin/controller/hompage/homepagecontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/core/functions/uploadfile.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/view/Homepage/widgets/bottomnavbar.dart';
import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/Homepage/widgets/editprofile.dart';
import 'package:super_admin/view/drawerpages/addacount/ContractAttachment.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdonebutton.dart';
import 'package:super_admin/view/test.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
    MyServices serv = Get.find();

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
                body: GetBuilder<HomePageController>(
                  builder: (controller) =>
                      controller.screens[controller.currentindex],
                ),
                appBar: customappbar(drawerKey),
                backgroundColor: Colors.white,
                extendBody: true, // <--- do not forget mark this as true
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: AppBarGod())));
  }
}

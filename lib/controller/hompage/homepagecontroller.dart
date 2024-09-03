import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/functions/handlingdata.dart';
import 'package:super_admin/data/datasource/remote/home/homedata.dart';
import 'package:super_admin/data/datasource/remote/manualreservation/manualreservation.dart';
import 'package:super_admin/data/model/me.dart';
import 'package:super_admin/view/Homepage/screens/favorite.dart';
import 'package:super_admin/view/Homepage/screens/home.dart';
import 'package:super_admin/view/Homepage/screens/settings.dart';

import '../../view/Homepage/screens/profile.dart';

class HomePageController extends GetxController {
  bool notificationsEnabled = true;
  double volumeLevel = 0.5;
  String selectedLanguage = 'English';

  final List<String> languages = ['English', 'Spanish', 'French', 'German'];
  GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();

  int index = 0;
  int currentindex = 0;
  List<Widget> screens = [Home(), Favorite(), Settings(), Profile()];
  MeModel me = MeModel();
  Statusrequest statusrequest = Statusrequest.none;
  Statusrequest mestatusrequest = Statusrequest.none;

  ManualReservationData manualReservationData =
      ManualReservationData(Get.find());
  HomeData homeData = HomeData(Get.find());

  getdata() async {
    print('Getting data');
    statusrequest = Statusrequest.loading;
    update();
    var response = await manualReservationData.postdata();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onReady() {
    print("-----------------ready");
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onInit() async {
    print("init Home page");

    super.onInit();
  }
}

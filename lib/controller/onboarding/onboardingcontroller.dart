import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onpagechanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  MyServices ser = Get.find();

  int currentpage = 0;
  late PageController pagecontroller;
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      Get.offAllNamed(AppRoutes.login);
    }
    pagecontroller.animateToPage(currentpage,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    if (index == 2) {
      ser.shared.setString("onboarding", "1");
    }

    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}

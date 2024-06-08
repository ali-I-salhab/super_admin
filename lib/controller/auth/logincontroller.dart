import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/data/datasource/remote/auth/login_data.dart';
import 'package:super_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';

abstract class Logincontroller extends GetxController {
  gotosignuppage();
  gotoforgetpasword();
  login();
  showpassword();
}

class LogincontrollerImp extends Logincontroller {
  late TextEditingController email;
  bool passwordstatus = true;
  late TextEditingController password;
  Statusrequest statusrequest = Statusrequest.none;
  // GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  LoginData logindata = LoginData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  @override
  login() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await logindata.postdata(
        email.text.toString(), password.text.toString());
    // await startcontroller.sections();
    // await startcontroller.services();

    statusrequest = handlingdata(response);

    if (response['status'] == 'success') {
      myServices.shared.setString('id', response['data']['user_id']);
      myServices.shared.setString('email', response['data']['user_email']);
      myServices.shared.setString('phone', response['data']['user_phone']);
      myServices.shared.setString('username', response['data']['user_name']);
      myServices.shared.setString('step', '2');
      // FirebaseMessaging.instance.subscribeToTopic("user");

      // FirebaseMessaging.instance
      //     .subscribeToTopic("user${response['data']['user_id']}");

      Get.offAllNamed(AppRoutes.homepage);
    }

    update();
  }

  @override
  gotosignuppage() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });

    email = TextEditingController();

    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  gotoforgetpasword() {
    Get.offNamed(AppRoutes.forgetpassword);
  }

  @override
  showpassword() {
    passwordstatus = !passwordstatus;
    update();
  }
}

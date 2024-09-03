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

  get formstatelogin => null;
  Future<void> activateAccount(BuildContext context) async {
    print(Get.currentRoute);
    print(Uri.parse(Get.currentRoute).pathSegments);
    List<String> data = Uri.parse(Get.currentRoute).pathSegments;
    print("----------------------------------activate account");
    final response = await logindata.activateaccount(
      data[1], data[2],
      // headers: {"Content-Type": "application/json"},
    );
    print("---------------------------> $response");
    // print(response['token']);
    // print(response.statusCode);
    if (response['statuscode'] == 204) {
      // Account activated successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account activated successfully!")),
      );
      Get.offNamed(AppRoutes.signup);
      // Optionally navigate to login or home page
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to activate account.")),
      );
      Get.offNamed(AppRoutes.signup);
    }
  }

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

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:get/get.dart';
import 'package:super_admin/core/functions/handlingdata.dart';
import 'package:super_admin/data/datasource/remote/auth/login_data.dart';

abstract class ResetPasswordController extends GetxController {}

class ResetPasswordControllerimpl extends ResetPasswordController {
  late TextEditingController email;
  LoginData logindata = LoginData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  RxBool isemailsended = false.obs;
  @override
  void onInit() {
    email = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  // gotoresetpasswordconfirmation() {

  // }

  resetpassword() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));

    var response = await logindata.resetpassword(
      email.text.toString(),
    );
    await Future.delayed(Duration(seconds: 3));
    Get.back();
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
      } else {
        Get.defaultDialog(
            title: response['status'] + response['statuscode'],
            middleText: response['details'] ?? "no details available");
        statusrequest = Statusrequest.failure;
      }
    } else {
      Get.defaultDialog(
        // barrierDismissible: false,
        title: "serverfailure",
        content: Container(child: Text("Internal Server exception")),
      );
    }

    update();
  }
}

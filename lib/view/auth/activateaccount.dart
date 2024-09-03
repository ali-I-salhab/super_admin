import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:super_admin/controller/auth/logincontroller.dart';
import 'package:super_admin/core/constants/colors.dart';

class ActivateAccountPage extends StatelessWidget {
  ActivateAccountPage();

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());
    // Call activateAccount when the page is loaded
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => controller.activateAccount(context));

    return Scaffold(
      appBar: AppBar(
        title: Text("Activate Account"),
        centerTitle: true,
        backgroundColor: AppColors.main,
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

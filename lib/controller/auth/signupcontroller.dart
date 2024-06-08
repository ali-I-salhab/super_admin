import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/signup_data.dart';

abstract class Signupcontroller extends GetxController {
  signup();
  gotosignin();
  gotosuccesssignup();
}

class SignupcontrollerImp extends Signupcontroller {
  String buttonstatus = "signup";
  bool isloginpahe = false;
  // GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController loginemail;

  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  late TextEditingController fullname;
  SignupData signupdata = SignupData(Get.find());
  MyServices myServices = Get.find();
  LoginData logindata = LoginData(Get.find());

  List data = [];
  Statusrequest? statusrequest = Statusrequest.none;
  @override
  gotosignin() {
    Get.offAllNamed(AppRoutes.login);
  }

  gotoverifycode() {
    // Get.toNamed(AppRoutes.verifycode, arguments: {'email': email.text});
  }

  // gotosuccesssignup() {
  //   Get.offAllNamed(AppRoutes.successsignup);
  // }
  login() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await logindata.postdata(
        loginemail.text.toString(), password.text.toString());

    print("-------------------------login response-------------------->");
    print(response);

    statusrequest = handlingdata(response);
    update();
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        myServices.shared.setString('id', response['data']['customer_id']);
        myServices.shared
            .setString('email', response['data']['customer_email']);
        myServices.shared
            .setString('phone', response['data']['customer_phone']);
        myServices.shared
            .setString('username', response['data']['customer_name']);
        // myServices.shared
        //     .setString('profile', response['data']['user_profile']);

        myServices.shared.setString('step', '2');
        // FirebaseMessaging.instance.subscribeToTopic("user");

        // FirebaseMessaging.instance
        //     .subscribeToTopic("user${response['data']['user_id']}");

        Get.offAllNamed(AppRoutes.homepage);
      } else {
//
        statusrequest = Statusrequest.none;

        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.w)),
            title: Text(
              'Alert !!',
              style: GoogleFonts.poppins(color: AppColors.red),
            ),
            content: const Text('Email or Password Not vaild !'),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );
      }
    }

    update();
  }

  @override
  signup() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await signupdata.postdata(
        username.text.toString(),
        fullname.text.toString(),
        phone.text.toString(),
        email.text.toString(),
        password.text.toString());

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.toNamed(AppRoutes.verifycode, arguments: {'email': email.text});

        Get.snackbar('success', 'enter verify code sended to :${email.text}',
            dismissDirection: DismissDirection.horizontal,
            duration: Duration(seconds: 3),
            backgroundColor: AppColors.primarycolor);
      } else {
        Get.defaultDialog(title: "42".tr, middleText: "43".tr);
        //here every thing ok but no data where pounded
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    loginemail = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    fullname = TextEditingController();
    username = TextEditingController();

    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // formstatesignup.currentState!.dispose();
    email.dispose();
    loginemail.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  gotosuccesssignup() {
    Get.toNamed(AppRoutes.success);
    // TODO: implement gotosuccesssignup
  }
}
// import 'package:ecommerceapp/core/class/statusrequest.dart';
// import 'package:ecommerceapp/data/datasource/remote/test_data.dart';
// import 'package:get/get.dart';

// import '../core/functions/handlingdata.dart';

// class Testcontroller extends GetxController {
//   TestData testdata = TestData(Get.find());
//   List data = [];
//   late Statusrequest statusrequest;
//   getdata() async {
//     statusrequest = Statusrequest.loading;
//     var response = await testdata.getdata();

//     statusrequest = handlingdata(response);
//     if (statusrequest == Statusrequest.success) {
//       if (response['status'] == 'success') {
//         data.addAll(response['data']);
//       } else {
//         statusrequest = Statusrequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getdata();
//     super.onInit();
//   }
// }

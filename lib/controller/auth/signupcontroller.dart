import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/data/datasource/remote/home/homedata.dart';
import 'package:super_admin/data/model/me.dart';
import 'package:super_admin/view/drawerpages/amenties/functions/dialogus.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/signup_data.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
  late TextEditingController newpassword;
  late TextEditingController re_newpassword;
  HomeData homeData = HomeData(Get.find());
  int selectedindex = 0;
  int switcherIndex2 = 0;
  Map me = {};
  late TextEditingController password;
  late TextEditingController repassword;

  late TextEditingController phone;
  late TextEditingController username;
  Statusrequest mestatusrequest = Statusrequest.none;
  late TextEditingController fullname;
  SignupData signupdata = SignupData(Get.find());
  MyServices myServices = Get.find();
  LoginData logindata = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

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
  resetpassword(String uid, String token, String password) async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));
    await Future.delayed(Duration(seconds: 4));

    update();
    var response =
        await logindata.resetpasswordconfirmation(uid, token, password);
    Get.back();
    print(
        "-------------------------reset password confirmation response-------------------->");
    print(response);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.signup);
      } else {
//
        statusrequest = Statusrequest.failure;

        Get.defaultDialog(
            title: response['status'] + " code " + response['statuscode'],
            middleText: response['details'] ?? "no details available");
      }
    }

    update();
  }

  login() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));

    update();
    var response = await logindata.postdata(
      loginemail.text.toString(),
      password.text.toString(),
    );
    Get.back();
    print("-------------------------login response-------------------->");
    print(response);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print(response);
        // myServices.shared.setString('id', response['data']['customer_id']);
        myServices.shared.setString('accesstoken', response['data']['access']);
        myServices.shared
            .setString('refreshtoken', response['data']['refresh']);
        // me = await getme();

        // myServices.shared.setString('email', me['data']['email']);
        // myServices.shared.setString('username', me['data']['username']);

        // myServices.shared.setString('phone', me['data']['[phone]']);

        // myServices.shared.setString('first_name', me['data']['first_name']);
        // myServices.shared.setString('last_name', me['data']['last_name']);

        // myServices.shared.setString('is_active', me['data']['is_active']);

        // myServices.shared.setString('id', me['data']['id']);
        // // myServices.shared
        //     .setString('phone', response['data']['customer_phone']);
        // myServices.shared
        //     .setString('username', response['data']['customer_name']);
        // myServices.shared
        //     .setString('profile', response['data']['user_profile']);

        // myServices.shared.setString('step', '2');
        // FirebaseMessaging.instance.subscribeToTopic("user");

        // FirebaseMessaging.instance
        //     .subscribeToTopic("user${response['data']['user_id']}");

        Get.offAllNamed(AppRoutes.homepage);
      } else {
//
        statusrequest = Statusrequest.failure;

        Get.defaultDialog(
            title: response['status'] + response['statuscode'],
            middleText: response['detail'] ?? "no details available");
      }
    }

    update();
  }

  getme() async {
    print('Getting me data');
    mestatusrequest = Statusrequest.loading;
    update();
    await Future.delayed(Duration(seconds: 5));
    var response = await homeData.getme();
    print("me response ---------------->");
    print(response);

    mestatusrequest = handlingdata(response);
    update();

    if (mestatusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print(response);

        update();
      } else {
        mestatusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  signup() async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));
    update();
    var response = await signupdata.postdata(
        username.text.toString(),
        fullname.text.toString(),
        phone.text.toString(),
        email.text.toString(),
        password.text.toString(),
        repassword.text.toString());
    Get.back();
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.toNamed(AppRoutes.signup, arguments: {'email': email.text});

        Get.snackbar(
            'success', 'press activation linke which  sended to :${email.text}',
            dismissDirection: DismissDirection.horizontal,
            duration: Duration(seconds: 7),
            backgroundColor: AppColors.primarycolor);
      } else {
        Get.defaultDialog(
            title: response['status'] + response['statuscode'],
            middleText: response['details'] ?? "no details available");
        statusrequest = Statusrequest.failure;
      }
    } else {
      Get.defaultDialog(
        barrierDismissible: false,
        title: "serverfailure",
        content: Container(child: Text("Internal Server exception")),
      );
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
    newpassword = TextEditingController();
    re_newpassword = TextEditingController();

    password = TextEditingController();
    repassword = TextEditingController();

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
    repassword.dispose();
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

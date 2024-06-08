import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_admin/controller/auth/verifycodecontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';

import '../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../controller/forgetpassword/verifycodeforgetpasswordcontroller.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifycodeForgetpassword extends StatelessWidget {
  const VerifycodeForgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodecontrollerImp controller = Get.put(VerifycodecontrollerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            'رمز التحقق',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.black,
                ),
          ),
        ),
        body: GetBuilder<VerifycodecontrollerImp>(
          builder: (controller) {
            return Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                  margin: const EdgeInsets.all(35),
                  child: ListView(
                    children: [
                      // const LogoAuth(),
                      Text(
                        'ادخل رمز التحقق الذي تم ارسالة الى بريدك الالكتروني',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OtpTextField(
                          textStyle: TextStyle(fontSize: 19),
                          borderRadius: BorderRadius.circular(12),
                          focusedBorderColor: AppColors.primarycolor,
                          enabledBorderColor: AppColors.grey,
                          borderColor: Colors.black,
                          borderWidth: 5,
                          showFieldAsBox: true,
                          fieldWidth: 50,
                          numberOfFields: 4,
                          onSubmit: (String code) async {
                            {
                              print(code);
                              print("dfdfdfdf");
                              var status =
                                  await controller.getverifycodestatus(code);

                              if (Get.previousRoute.toString() == "/signup") {
                                print("sssssssssfrom condeitionssssssssss");
                                if (status.toString() == "true") {
                                  print("correct code ");

                                  Get.offAndToNamed(AppRoutes.signup);
                                } else {
                                  Get.snackbar("error", "wrong verify code");
                                }
                              }
                              if (Get.previousRoute == "/forgetpassword") {
                                if (status.toString() == "true") {
                                  Get.offAllNamed(AppRoutes.resetpassword,
                                      arguments: {
                                        "email": controller.email.toString()
                                      });
                                } else {
                                  Get.snackbar("error", "wrong verify code");
                                }
                              }
                            }
                          }),

                      const SizedBox(
                        height: 15,
                      ),

                      // CustomAuthButton(
                      //   text: 'Reset Password',
                      //   onPressed: () {
                      //     controller.gotoresetpage();
                      //   },
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}

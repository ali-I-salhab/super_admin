import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/alertexitapp.dart';
import 'package:super_admin/view/auth/widgets/customSwitchslider.dart';
import 'package:super_admin/view/widgets/auth/authtextformfield.dart';
import 'package:super_admin/view/widgets/auth/logo.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:image_editor/image_editor.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../widgets/auth/textsignup.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // LogincontrollerImp logincontroller = Get.put(LogincontrollerImp());

    SignupcontrollerImp controller = Get.put(SignupcontrollerImp());
    final _formKey = GlobalKey<FormState>();
    ScrollController scroller = ScrollController();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text('17'.tr, style: Theme.of(context).textTheme.displayLarge),
        ),
        body: WillPopScope(
            onWillPop: alertexitpp,
            child: Container(
              margin: EdgeInsets.all(10.sp),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Text(
                    "Welcome !!!",
                    style: GoogleFonts.poppins(fontSize: 20.sp),
                  ),
                  Text(
                    "Sign up or Login to your Account",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  GetBuilder<SignupcontrollerImp>(builder: (controller) {
                    return CustomSWitchslider(
                      controller: controller,
                    );
                  }),
                  AnimatedSlider(),
                  // const LogoAuth(),
                  // const LogoAuth(),
                  GetBuilder<SignupcontrollerImp>(
                    builder: ((controller) {
                      return controller.isloginpahe
                          ? GestureDetector(
                              onHorizontalDragStart: (df) {
                                controller.buttonstatus == "signup"
                                    ? controller.buttonstatus = 'login'
                                    : controller.buttonstatus = 'signup';
                                controller.isloginpahe =
                                    !controller.isloginpahe;

                                controller.update();
                              },
                              onHorizontalDragEnd: (s) {
                                print("$s rrrrrrrrr");
                                controller.buttonstatus == "signup"
                                    ? controller.buttonstatus = 'login'
                                    : controller.buttonstatus = 'signup';
                                controller.isloginpahe =
                                    !controller.isloginpahe;

                                controller.update();
                              },
                              child: Form(
                                key: _formKey,
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      CustomTextformfieldAuth(
                                        title: "Full name",
                                        hint: "Enter your full name",
                                        mycontroller: controller.fullname,
                                        valid: (val) {
                                          return validate(val.toString(), 5,
                                              100, 'username');
                                        },
                                      ),
                                      CustomTextformfieldAuth(
                                        title: "username",
                                        hint: "Enter your user-name",
                                        mycontroller: controller.username,
                                        valid: (val) {
                                          return validate(val.toString(), 5,
                                              100, 'username');
                                        },
                                      ),
                                      CustomTextformfieldAuth(
                                          mycontroller: controller.email,
                                          valid: (val) {
                                            return validate(val.toString(), 5,
                                                100, 'email');
                                          },
                                          title: "Email",
                                          hint: "Enter your Email"),
                                      CustomTextformfieldAuth(
                                          isphone: true,
                                          mycontroller: controller.phone,
                                          valid: (val) {
                                            return validate(val.toString(), 5,
                                                100, 'email');
                                          },
                                          title: "Phone number",
                                          hint: "Enter your phone"),
                                      CustomTextformfieldAuth(
                                          mycontroller: controller.password,
                                          valid: (val) {
                                            return validate(val.toString(), 5,
                                                100, 'password');
                                          },
                                          title: "Create Password",
                                          hint: "Enter your password"),
                                      ElevatedButton(
                                        child: Text("elevated"),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await controller.signup();
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Form(
                              key: _formKey,
                              child: GestureDetector(
                                onHorizontalDragStart: (df) {
                                  controller.buttonstatus == "signup"
                                      ? controller.buttonstatus = 'login'
                                      : controller.buttonstatus = 'signup';
                                  controller.isloginpahe =
                                      !controller.isloginpahe;

                                  controller.update();
                                },
                                onHorizontalDragEnd: (s) {
                                  print("$s rrrrrrrrr");
                                  controller.buttonstatus == "signup"
                                      ? controller.buttonstatus = 'login'
                                      : controller.buttonstatus = 'signup';
                                  controller.isloginpahe =
                                      !controller.isloginpahe;

                                  controller.update();
                                },
                                child: Column(
                                  children: [
                                    LogoAuth(),
                                    CustomTextformfieldAuth(
                                        valid: (val) {
                                          return validate(
                                              val.toString(), 5, 100, 'email');
                                        },
                                        mycontroller: controller.loginemail,
                                        // logincontroller.email,
                                        title: "Email",
                                        hint: "Enter your Email"),
                                    CustomTextformfieldAuth(
                                        valid: (val) {
                                          return validate(val.toString(), 5,
                                              100, 'password');
                                        },
                                        mycontroller: controller.password,
                                        title: "Enter password",
                                        hint: "Enter your password"),
                                    Handlingdataview(
                                      statusrequest: controller.statusrequest!,
                                      widget: ElevatedButton(
                                        child: Text("sdsdsd"),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // Get.offAllNamed(AppRoutes.AuthPage);
                                            await controller.login();

                                            print(
                                                "----------------------------");
                                          }
                                          // await logincontroller.login();
                                        },
                                      ),
                                    )
                                    // CustomTextFormField(label: label, valid: valid, icon: icon, mycontroller: mycontroller, hint: hint, isnumeric: isnumeric)
                                  ],
                                ),
                              ));
                    }),
                  ),
                ],
              ),
            )));
  }
}

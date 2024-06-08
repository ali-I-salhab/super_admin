import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/alertexitapp.dart';
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
    Future<Uint8List> loadFromAsset(String key) async {
      final ByteData byteData = await rootBundle.load(key);
      return byteData.buffer.asUint8List();
    }
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
            child:
                // GetBuilder<SignupcontrollerImp>(builder: (controller) {
                // return (controller.statusrequest != null &&
                //         controller.statusrequest == Statusrequest.loading)
                //     ? Center(
                //         child: LottieBuilder.asset(
                //           ImageAssets.loadinglottie,
                //           width: 200,
                //           height: 200,
                //         ),
                //       )
                //     :
                Container(
              margin: const EdgeInsets.all(35),
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
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(18)),
                          width: 80.w,
                          height: 8.h,
                        ),
                        Positioned(
                          top: 1.h,
                          left: 3.w,
                          child: InkWell(
                            onTap: () {
                              controller.buttonstatus = "signup";
                              controller.isloginpahe = false;

                              controller.update();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.buttonstatus == "signup"
                                      ? AppColors.blue
                                      : AppColors.blue.withOpacity(0),
                                  borderRadius: BorderRadius.circular(18)),
                              width: 40.w,
                              height: 6.h,
                              child: Center(
                                child: Text("Login"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 1.h,
                          right: 4.w,
                          child: InkWell(
                            onTap: () {
                              controller.buttonstatus = "login";

                              controller.isloginpahe = true;
                              controller.update();
                              print("login");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.buttonstatus == "login"
                                      ? AppColors.blue
                                      : AppColors.blue.withOpacity(0),
                                  borderRadius: BorderRadius.circular(18)),
                              width: 40.w,
                              height: 6.h,
                              child: Center(
                                child: Text("Signup"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
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
                  // const SizedBox(
                  //   height: 30,
                  // ),

                  // CustomTextFormField(
                  //   isnumeric: false,
                  //   valid: (val) {
                  //     return validate(
                  //         val.toString(), 3, 100, 'username');
                  //   },
                  //   hint: '23'.tr,
                  //   icon: Icons.person_2_outlined,
                  //   label: '20'.tr,
                  //   mycontroller: controller.username,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // CustomTextFormField(
                  //   isnumeric: true,
                  //   valid: (val) {
                  //     return validate(
                  //         val.toString(), 5, 100, 'phone');
                  //   },
                  //   hint: '22'.tr,
                  //   icon: Icons.phone_outlined,
                  //   label: '21'.tr,
                  //   mycontroller: controller.phone,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // CustomTextFormField(
                  //   isnumeric: false,
                  //   valid: (val) {
                  //     return validate(
                  //         val.toString(), 9, 100, 'email');
                  //   },
                  //   hint: '29'.tr,
                  //   icon: Icons.email_outlined,
                  //   label: '18'.tr,
                  //   mycontroller: controller.email,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // CustomTextFormField(
                  //   isnumeric: false,
                  //   valid: (val) {
                  //     return validate(
                  //         val.toString(), 7, 100, 'password');
                  //   },
                  //   hint: '13'.tr,
                  //   icon: Icons.lock_outline,
                  //   label: '19'.tr,
                  //   mycontroller: controller.password,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // CustomAuthButton(
                  //   text: '17'.tr,
                  //   onPressed: () {
                  //     controller.signup();
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // TextSignup(
                  //   ontap: () {
                  //     controller.gotosignin();
                  //   },
                  //   firsttext: '16'.tr,
                  //   Secondtext: '15'.tr,
                  // )
                ],
              ),
            )));
  }
}

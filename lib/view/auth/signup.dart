import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/alertexitapp.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/auth/widgets/customSwitchslider.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customdonebutton.dart';
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
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: WillPopScope(
            onWillPop: alertexitpp,
            child: Container(
              // height: 90.h,
              margin: EdgeInsets.all(10.sp),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SlideSwitcher(
                    first: 'Login',
                    second: 'Signup',
                    ontapfirst: () {
                      controller.buttonstatus == "signup";

                      controller.isloginpahe = !controller.isloginpahe;

                      controller.update();
                    },
                    ontapsecond: () {
                      controller.buttonstatus == "login";

                      controller.isloginpahe = !controller.isloginpahe;

                      controller.update();
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    child: Image.asset(ImageAssets.loginbackground),
                  ),
                  GetBuilder<SignupcontrollerImp>(
                    builder: ((controller) {
                      return controller.isloginpahe
                          ? Form(
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
                                      autofillhints: [AutofillHints.name],
                                      mycontroller: controller.fullname,
                                      valid: (val) {
                                        return validate(
                                            val.toString(), 5, 100, 'username');
                                      },
                                    ),
                                    CustomTextformfieldAuth(
                                      autofillhints: [AutofillHints.username],
                                      title: "username",
                                      hint: "Enter your user-name",
                                      mycontroller: controller.username,
                                      valid: (val) {
                                        return validate(
                                            val.toString(), 5, 100, 'username');
                                      },
                                    ),
                                    CustomTextformfieldAuth(
                                        autofillhints: [AutofillHints.email],
                                        mycontroller: controller.email,
                                        valid: (val) {
                                          return validate(
                                              val.toString(), 5, 100, 'email');
                                        },
                                        title: "Email",
                                        hint: "Enter your Email"),
                                    CustomTextformfieldAuth(
                                        autofillhints: [
                                          AutofillHints.telephoneNumber
                                        ],
                                        isphone: true,
                                        mycontroller: controller.phone,
                                        valid: (val) {
                                          return validate(
                                              val.toString(), 5, 100, 'email');
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
                                    CustomTextformfieldAuth(
                                        mycontroller: controller.repassword,
                                        valid: (val) {
                                          return validate(val.toString(), 5,
                                              100, 'password');
                                        },
                                        title: "retype your password",
                                        hint: "Enter your password again"),
                                    InkWell(
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.sp, horizontal: 12.sp),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 12.sp, horizontal: 12.sp),
                                        decoration: BoxDecoration(
                                            color: AppColors.main,
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                        child: Center(
                                          child: Text(
                                            "Sign in",
                                            style: AppTextStyle.mainwhite,
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          await controller.signup();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Form(
                              key: _formKey,
                              child: Column(
                                children: [
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
                                        return validate(
                                            val.toString(), 5, 100, 'password');
                                      },
                                      mycontroller: controller.password,
                                      title: "Enter password",
                                      hint: "Enter your password"),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(child: SizedBox()),
                                      Clicable(
                                        ontap: () {
                                          Get.toNamed(AppRoutes.success);
                                        },
                                        child: RichText(
                                            textAlign: TextAlign.left,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Forget password",
                                                  style: TextStyle(
                                                      color: Colors.blue))
                                            ])),
                                      ),
                                    ],
                                  ),

                                  InkWell(
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.sp, horizontal: 12.sp),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 12.sp, horizontal: 12.sp),
                                      decoration: BoxDecoration(
                                          color: AppColors.main,
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Center(
                                        child: Text(
                                          "Sign in",
                                          style: AppTextStyle.mainwhite,
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        // Get.offAllNamed(AppRoutes.AuthPage);
                                        await controller.login();

                                        print("----------------------------");
                                      }
                                      // await logincontroller.login();
                                    },
                                  ),

                                  Row(children: <Widget>[
                                    Expanded(child: Divider()),
                                    Text(
                                      " or log in with ",
                                      style: AppTextStyle.greysmall,
                                    ),
                                    Expanded(child: Divider()),
                                  ]),
                                  SizedBox(
                                    height: 12.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 40.sp,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                blurStyle: BlurStyle.outer),
                                          ],
                                        ),
                                        child: Iconify(AppIcons.google),
                                      ),
                                      Container(
                                        height: 40.sp,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                blurStyle: BlurStyle.outer),
                                          ],
                                        ),
                                        child: Iconify(AppIcons.facebook),
                                      ),
                                      Container(
                                        height: 40.sp,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                blurStyle: BlurStyle.outer),
                                          ],
                                        ),
                                        child: Iconify(AppIcons.apple),
                                      ),
                                    ],
                                  )
                                  // CustomTextFormField(label: label, valid: valid, icon: icon, mycontroller: mycontroller, hint: hint, isnumeric: isnumeric)
                                ],
                              ));
                    }),
                  ),
                ],
              ),
            )));
  }
}

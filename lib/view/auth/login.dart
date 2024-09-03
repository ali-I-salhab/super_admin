import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/auth/logincontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/view/widgets/auth/customauthbutton.dart';
import 'package:super_admin/view/widgets/auth/customtextformfield.dart';
import 'package:super_admin/view/widgets/auth/logo.dart';
import 'package:super_admin/view/widgets/auth/textsignup.dart';

import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import 'package:ionicons/ionicons.dart';
import "package:sizer/sizer.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());

    return WillPopScope(
      onWillPop: () {
        return alertexitpp();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            title:
                Text('15'.tr, style: Theme.of(context).textTheme.displayLarge!),
          ),
          body: GetBuilder<LogincontrollerImp>(
            builder: (controller) => Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                  child: Container(
                    margin: EdgeInsets.all(35),
                    child: Form(
                      key: controller.formstatelogin,
                      child: ListView(
                        children: [
                          const LogoAuth(),

                          SizedBox(
                            height: 1.h,
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Ionicons.logo_vimeo,
                          //       color: Colors.red,
                          //     ),
                          //     Icon(
                          //       Ionicons.logo_instagram,
                          //       color: Colors.red,
                          //     ),
                          //     Icon(
                          //       Ionicons.logo_tiktok,
                          //     ),
                          //     Icon(
                          //       Ionicons.logo_youtube,
                          //       color: Colors.red,
                          //     ),
                          //     Icon(
                          //       Ionicons.logo_facebook,
                          //       color: Colors.blue,
                          //     ),
                          //   ].animate(interval: 700.ms).moveX(
                          //       duration: 1000.ms,
                          //       begin: Get.width,
                          //       end: -Get.width / 4),
                          // ),
                          // Text(
                          //   'اهلا بك',
                          //   textAlign: TextAlign.center,
                          //   style: Theme.of(context).textTheme.displayLarge,
                          // ),
                          // Text('اهلا بك',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(fontFamily: "Kufi")),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomTextFormField(
                            isnumeric: false,
                            valid: (val) {
                              print(val);
                              return validate(val.toString(), 10, 100, 'email');
                            },
                            hint: '40'.tr,
                            icon: Icons.email_outlined,
                            label: '18'.tr,
                            mycontroller: controller.email,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GetBuilder<LogincontrollerImp>(
                            builder: (context) => CustomTextFormField(
                              isnumeric: false,
                              ontap: () {
                                print('icon tapped');
                                controller.showpassword();
                              },
                              ispasswordfield: true,
                              valid: (val) {
                                return validate(
                                    val.toString(), 5, 100, 'password');
                              },
                              icon: controller.passwordstatus
                                  ? Icons.lock_outlined
                                  : Icons.no_encryption_outlined,
                              hint: '13'.tr,
                              label: '19'.tr,
                              mycontroller: controller.password,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                '14'.tr,
                                textAlign: TextAlign.end,
                                style: TextStyle(color: AppColors.primarycolor),
                              ),
                            ),
                            onTap: () {
                              controller.gotoforgetpasword();
                            },
                          ),
                          CustomAuthButton(
                            text: '15'.tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextSignup(
                            ontap: () {
                              print("tabbed");
                              Get.delete();
                              controller.gotosignuppage();
                            },
                            firsttext: '16'.tr,
                            Secondtext: '17'.tr,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:super_admin/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/validinput.dart';
import 'package:super_admin/view/widgets/auth/customauthbutton.dart';
import 'package:super_admin/view/widgets/auth/customtextformfield.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordcontrollerImp controller =
        Get.put(ForgetpasswordcontrollerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            "14".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontFamily: 'playfair'),
          ),
        ),
        body: GetBuilder<ForgetpasswordcontrollerImp>(
            builder: (controller) => Handlingdataview(
                  statusrequest: controller.statusrequest!,
                  widget: Container(
                    margin: const EdgeInsets.all(35),
                    child: ListView(
                      children: [
                        // const LogoAuth(),
                        Text(
                          "40".tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Form(
                          key: controller.formstate,
                          child: CustomTextFormField(
                            isnumeric: false,
                            valid: (val) {
                              return validate(val.toString(), 10, 100, 'email');
                            },
                            hint: "40".tr,
                            icon: Icons.email_outlined,
                            label: '18'.tr,
                            mycontroller: controller.email,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomAuthButton(
                          text: '30'.tr,
                          onPressed: () {
                            controller.gotoverifycode();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}

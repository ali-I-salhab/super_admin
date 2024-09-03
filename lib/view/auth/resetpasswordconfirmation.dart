import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/auth/signupcontroller.dart';
import 'package:super_admin/core/functions/validinput.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/widgets/auth/authtextformfield.dart';
import 'package:path/path.dart' as p;

class ResetPasswordConfirmation extends StatelessWidget {
  const ResetPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    SignupcontrollerImp controller = Get.put(SignupcontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(title: "Reset Password", isactioned: false),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: controller.formstate,
              child: Column(
                children: [
                  CustomTextformfieldAuth(
                      valid: (val) {
                        return validate(val.toString(), 5, 100, 'password');
                      },
                      title: "Type Your password",
                      mycontroller: controller.newpassword,
                      hint: "Enter New Password"),
                  CustomTextformfieldAuth(
                      valid: (val) {
                        return validate(val.toString(), 5, 100, 'password');
                      },
                      title: "re Type Your password",
                      mycontroller: controller.re_newpassword,
                      hint: "re Enter New Password"),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.sp),
                child: CustomNextButton(ontap: () async {
                  if (controller.formstate.currentState!.validate()) {
                    if (controller.newpassword.text ==
                        controller.re_newpassword.text) {
                      print(Uri.parse(Get.currentRoute).pathSegments);
                      await controller.resetpassword(
                          Uri.parse(Get.currentRoute).pathSegments[3],
                          Uri.parse(Get.currentRoute).pathSegments[4],
                          controller.newpassword.text);
                    } else {
                      Get.snackbar("Error", "Two passwords not matched");
                    }
                  }
                }))
          ],
        ),
      ),
    );
  }
}

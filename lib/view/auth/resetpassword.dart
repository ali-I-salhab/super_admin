import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_admin/controller/auth/resetpasswordcontroller.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/validinput.dart';
import 'package:super_admin/view/widgets/auth/authtextformfield.dart';
import 'package:super_admin/view/widgets/auth/customauthbutton.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerimpl controller =
        Get.put(ResetPasswordControllerimpl());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text(
          'Forget password',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.black, fontFamily: 'playfair'),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: Get.width,
        child: controller.isemailsended.value
            ? Text("Check your email to reset password")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextformfieldAuth(
                      valid: (val) {
                        return validate(val.toString(), 5, 100, 'email');
                      },
                      mycontroller: controller.email,
                      // logincontroller.email,
                      title: "Email",
                      hint: "Enter your Email"),
                  Container(
                    width: Get.width - 30,
                    child: CustomAuthButton(
                      text: 'Continue',
                      onPressed: () {
                        controller.resetpassword();
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

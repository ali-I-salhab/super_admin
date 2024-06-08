import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_admin/controller/onboarding/onboardingcontroller.dart';
import 'package:super_admin/core/constants/colors.dart';

class Customdotonboarding extends StatelessWidget {
  const Customdotonboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              4,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    width: controller.currentpage == index ? 15 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.blue),
                    duration: const Duration(milliseconds: 500),
                  ))
        ],
      );
    });
  }
}

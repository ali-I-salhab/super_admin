// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:super_admin/controller/auth/signupcontroller.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomSWitchslider extends StatefulWidget {
  SignupcontrollerImp controller;
  CustomSWitchslider({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomSWitchslider> createState() => _CustomSWitchsliderState();
}

class _CustomSWitchsliderState extends State<CustomSWitchslider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(18)),
          width: 90.w,
          height: 8.h,
        ),
        Positioned(
          top: 1.h,
          left: 3.w,
          child: InkWell(
            onTap: () {
              widget.controller.buttonstatus = "signup";
              widget.controller.isloginpahe = false;

              widget.controller.update();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: widget.controller.buttonstatus == "signup"
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
              widget.controller.buttonstatus = "login";

              widget.controller.isloginpahe = true;
              widget.controller.update();
              print("login");
            },
            child: Container(
              decoration: BoxDecoration(
                  color: widget.controller.buttonstatus == "login"
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
  }
}

class AnimatedSlider extends StatefulWidget {
  const AnimatedSlider({super.key});

  @override
  State<AnimatedSlider> createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> {
  @override
  double hight = 30.w;
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: 80.w,
            height: 10.h,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        hight = hight * 2;
                      });
                    },
                    child: Text('log in')),
                InkWell(
                    onTap: () {
                      setState(() {
                        hight = hight * 2;
                      });
                    },
                    child: Text("Signup"))
              ],
            ),
          ),
          AnimatedContainer(
            color: Colors.black,
            width: hight,
            // height: 10.h,
            duration: Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}

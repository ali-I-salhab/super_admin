import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CutomStepper extends StatelessWidget {
  final int steps;
  const CutomStepper({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              8,
              (index) => Container(
                    decoration: BoxDecoration(
                        color: index < steps ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(12.sp)),
                    width: 25.sp,
                    height: 4.sp,
                    margin: EdgeInsets.only(right: 2.sp),
                  ))
        ],
      ),
    );
  }
}

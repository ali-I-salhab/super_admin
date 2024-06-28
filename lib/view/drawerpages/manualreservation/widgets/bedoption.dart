import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';

class Bedoption extends StatelessWidget {
  const Bedoption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.sp),
      decoration: BoxDecoration(
        // color: Colors.blueAccent,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 1),
              blurStyle: BlurStyle.outer)
        ],
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(4.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r"option 1 (Extra 5$)",
                  style: TextStyle(color: AppColors.main, fontSize: 18.sp),
                ),
                Container(
                  // color: Colors.red,
                  width: 70.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          CustomPersonCard(
                            number: '1',
                            name: "single bed",
                            icon: AppIcons.singlebed,
                          ),
                          CustomPersonCard(
                            number: '1',
                            name: "single bed",
                            icon: AppIcons.singlebed,
                          ),
                          CustomPersonCard(
                            number: '1',
                            name: "single bed",
                            icon: AppIcons.singlebed,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Checkbox(value: false, onChanged: (c) {})
        ],
      ),
    );
  }
}

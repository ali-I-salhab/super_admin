import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/bedoption.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';

class RoomBedOptions extends StatelessWidget {
  const RoomBedOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      width: 95.w,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 1),
              blurStyle: BlurStyle.outer)
        ],
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Room 1",
            style: TextStyle(color: AppColors.main, fontSize: 18.sp),
          ),
          SizedBox(
            height: 9.sp,
          ),
          Bedoption(),
          Bedoption(),
          Bedoption()
        ],
      ),
    );
  }
}

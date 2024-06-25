import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 26.w,
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.sp,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.edit,
              color: Colors.white,
              size: 12.sp,
            ),
            Text(
              " Edit profile",
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
          ],
        ));
  }
}

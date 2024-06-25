import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customcancelbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customconfirmbuttom.dart';

class HotelCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  void Function()? oncall;
  void Function()? oncancel;
  HotelCard(
      {super.key,
      required this.image,
      required this.name,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20.h,
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      width: 90.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.sp), boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.outer,
            color: Colors.black38,
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 2))
      ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRect(
                  child: Image.asset(
                    image,
                    height: 50.sp,
                    width: 50.sp,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Container(
                        width: 50.w,
                        // color: Colors.red,
                        child: Text(
                          "$name",
                          style:
                              TextStyle(color: AppColors.main, fontSize: 18.sp),
                        ),
                      ),
                    ),
                    Container(
                      width: 45.w,
                      child: Text(
                        "$location",
                        style:
                            TextStyle(color: AppColors.grey, fontSize: 12.sp),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5.sp,
                    ),
                    Callbutton()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

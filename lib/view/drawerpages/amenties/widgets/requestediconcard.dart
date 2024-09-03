import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/amenties/functions/dialogus.dart';

class RequestedIconCard extends StatelessWidget {
  const RequestedIconCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 2)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    color: AppColors.greyfat, shape: BoxShape.circle),
                child: Iconify(AppIcons.singlebed),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Text(
                'Swimming bool',
                style: AppTextStyle.main,
              )
            ],
          ),
          Row(
            children: [
              Iconify(AppIcons.editperson),
              SizedBox(
                width: 5.sp,
              ),
              Clicable(
                ontap: () {
                  showdeletedialogue();
                },
                child: Icon(
                  Icons.cancel,
                  color: AppColors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

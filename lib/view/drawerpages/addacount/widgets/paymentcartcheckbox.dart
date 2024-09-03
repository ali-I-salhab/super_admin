import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentCheckBox extends StatelessWidget {
  final String title;
  final bool val;
  final void Function(bool?)? onchange;

  const PaymentCheckBox(
      {super.key, required this.title, required this.val, this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
          ),
          Checkbox(
            value: val,
            onChanged: onchange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180)),
          ),
        ],
      ),
    );
  }
}

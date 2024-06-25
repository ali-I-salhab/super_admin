import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomTextformFieldonly extends StatelessWidget {
  final String label;
  final IconData icon;
  final String hint;
  // final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isnumeric;
  void Function()? ontap;
  bool ispasswordfield;

  CustomTextformFieldonly({
    super.key,
    this.ontap,
    this.ispasswordfield = false,
    required this.label,
    required this.valid,
    required this.icon,
    // required this.mycontroller,
    required this.hint,
    required this.isnumeric,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // controller: mycontroller,
        // obscureText: controller.passwordstatus && ispasswordfield ? true : false,
        keyboardType: isnumeric
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(width: 3, color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: AppColors.grey)),
          label: Text('$label'),
          suffixIcon: InkWell(
            child: Icon(icon),
            onTap: ontap,
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 10),
          labelStyle: const TextStyle(color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)),
        ));
  }
}

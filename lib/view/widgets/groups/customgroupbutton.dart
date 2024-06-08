import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomGroupButton extends StatelessWidget {
  final String text;
  final Color color;
  final GestureTapCallback ontap;

  const CustomGroupButton(
      {super.key,
      required this.text,
      required this.ontap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    // checkinternetstatus()
    return SizedBox(
      width: 30.w,
      child: MaterialButton(
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8)),
        onPressed: ontap,
        color: color,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

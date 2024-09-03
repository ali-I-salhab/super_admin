import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class SlideSwitcher extends StatefulWidget {
  final String first;
  final String second;
  final Function()? ontapfirst;
  final Function()? ontapsecond;

  const SlideSwitcher(
      {super.key,
      required this.first,
      required this.second,
      this.ontapfirst,
      this.ontapsecond});
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

double width = 80.w;
double height = 40.sp;
double loginAlign = -1;
double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _ToggleButtonState extends State<SlideSwitcher> {
  double? xAlign = loginAlign;
  Color? loginColor;
  Color? signInColor;

  @override
  void initState() {
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
          width: 85.w,
          height: 50.sp,
          margin: EdgeInsets.only(top: 2.sp),
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 1))
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(xAlign!, 0),
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: width * 0.5,
                  height: height,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = loginAlign;
                    loginColor = selectedColor;

                    signInColor = normalColor;
                  });

                  if (widget.ontapfirst != null) {
                    widget.ontapfirst!();
                  }
                  // widget.ontapfirst ?? widget.ontapfirst!();
                },
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      widget.first,
                      style: TextStyle(
                        color: loginColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = signInAlign;
                    signInColor = selectedColor;

                    loginColor = normalColor;
                  });
                  if (widget.ontapsecond != null) {
                    widget.ontapsecond!();
                  }

                  // widget.ontapsecond ?? widget.ontapsecond!();
                },
                child: Align(
                  alignment: Alignment(1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      widget.second,
                      style: TextStyle(
                        color: signInColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// a??b
// if a not null go with a else go with b
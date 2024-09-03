import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class AnimatedLoadingButton extends StatefulWidget {
  final String text;
  bool isLoading = false;
  final void Function()? ontap;

  AnimatedLoadingButton(this.text, this.ontap, {this.isLoading = false});

  @override
  _AnimatedLoadingButtonState createState() => _AnimatedLoadingButtonState();
}

class _AnimatedLoadingButtonState extends State<AnimatedLoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void didUpdateWidget(AnimatedLoadingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return InkWell(
          onTap: () {
            print("object");
            widget.ontap!();
            setState(() {
              widget.isLoading = true;
            });
          },
          child: Container(
              width: 30.w,
              height: 4.5.h,
              decoration: BoxDecoration(
                  color: AppColors.blue,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.sp)),
              child: widget.isLoading
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.all(3.sp),
                      child: UnconstrainedBox(
                        child: SizedBox(
                          height: 12.sp,
                          width: 12.sp,
                          child: FittedBox(
                            child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.amber
                                // value: _controller.value,
                                ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.all(3.sp),
                      child: UnconstrainedBox(
                        child: SizedBox(
                            child: Text(
                          widget.text,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

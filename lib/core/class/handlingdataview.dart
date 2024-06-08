import 'package:flutter/material.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Handlingdataview extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  final void Function()? ontap;
  Handlingdataview(
      {super.key,
      required this.statusrequest,
      this.ontap,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: LottieBuilder.asset(
              ImageAssets.loadinglottie,
              height: 10.h,
              width: 10.h,
            ),
          )
        : statusrequest == Statusrequest.offlinefailure
            ? InkWell(
                onTap: ontap,
                child: Column(
                  children: [
                    Center(
                      child: LottieBuilder.asset(
                        ImageAssets.nointernetconnectionlottie,
                        height: 15.h,
                        width: 15.h,
                      ),
                    ),
                    Text("Retry")
                  ],
                ))
            : Center(
                child: statusrequest == Statusrequest.serverfailure
                    ? LottieBuilder.asset(
                        ImageAssets.serverfailurelottie,
                        height: 15.h,
                        width: 15.h,
                      )
                    : statusrequest == Statusrequest.failure
                        ? Center(
                            child: LottieBuilder.asset(
                              ImageAssets.nodatalottie,
                              height: 15.h,
                              width: 15.h,
                            ),
                          )
                        : widget,
              );
  }
}
//  if (controller.statusrequest == Statusrequest.loading) {
//             return const Center(child: Text('loading'));
//           } else if (controller.statusrequest == Statusrequest.offlinefailure) {
//             return const Center(child: Text('offlinefailure'));
//           } else if (controller.statusrequest == Statusrequest.serverfailure) {
//             return const Center(child: Text('serverfailure'));
//           } else if (controller.statusrequest == Statusrequest.failure) {
//             return const Center(child: Text('no data'));
//           } else {
//             return Text('${controller.data[0]['user_phone']}');
//           }
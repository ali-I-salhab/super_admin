import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black.withOpacity(0.04),
        // appBar: customappbar(),
        body: Container(
          color: Colors.black.withOpacity(0.003),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue.withOpacity(0.01),
                pinned: true,
                expandedHeight: 10.h,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 7.h,
                    width: 100.w,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Container(
                          child: Center(
                              child: Text(
                            "Notifications",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.sp),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.sp),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.13))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                ...List.generate(
                  10,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 1.h, left: 1.w, right: 1.w),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You have a new notification!',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'This is the notification message.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

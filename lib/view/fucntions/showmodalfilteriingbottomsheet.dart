import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

Future<dynamic> Showfilteringbottomsheet(BuildContext context) {
  var _currentRangeValues = RangeValues(40, 80);

  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, StateSetter setSt /*You can rename this!*/) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.sp),
                    topLeft: Radius.circular(20.sp))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 22.sp),
                    child: Text(
                      "Filtering",
                      style: TextStyle(color: AppColors.blue, fontSize: 20.sp),
                    ),
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Price Range:",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 43, 39, 39),
                              fontSize: 15.sp),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    4.sp,
                                  ),
                                  topRight: Radius.circular(
                                    12.sp,
                                  ),
                                  bottomLeft: Radius.circular(
                                    12.sp,
                                  ),
                                  bottomRight: Radius.circular(
                                    4.sp,
                                  ))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${_currentRangeValues.start.round()}\$",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    4.sp,
                                  ),
                                  topRight: Radius.circular(
                                    12.sp,
                                  ),
                                  bottomLeft: Radius.circular(
                                    12.sp,
                                  ),
                                  bottomRight: Radius.circular(
                                    4.sp,
                                  ))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${_currentRangeValues.end.round()}\$",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChangeStart: (RangeValues values) {
                      print("start");
                      setSt(() {
                        print(values);
                        _currentRangeValues = values;
                      });
                    },
                    onChangeEnd: (RangeValues values) {
                      print("end");
                      setSt(() {
                        print(values);
                        _currentRangeValues = values;
                      });
                    },
                    onChanged: (RangeValues values) {
                      setSt(() {
                        print(values);
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ),
                Divider(
                  endIndent: 2,
                  indent: 2,
                  thickness: 0.5.w,
                  color: Colors.black.withOpacity(0.3),
                ),
                Row(
                  children: [
                    Container(
                      width: 30.sp,
                      height: 30.sp,
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.sp, vertical: 3.sp),
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: FittedBox(
                          child: Text(
                        "Rooms",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: AppColors.blue, shape: BoxShape.circle),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.all(4.sp),
                          color: Colors.black.withOpacity(0.03),
                          child: Row(
                            children: [
                              ...List.generate(
                                  10,
                                  (index) => Container(
                                        width: 30.sp,
                                        height: 30.sp,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.sp, vertical: 3.sp),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.sp),
                                        child: FittedBox(
                                            child: Text(
                                          "$index",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        decoration: BoxDecoration(
                                            color: AppColors.blue,
                                            shape: BoxShape.circle),
                                      ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
      });
}

import 'dart:math';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/controller/amenties/amentiesmainpagecontroller.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/clicable.dart';

import 'package:super_admin/view/Homepage/widgets/customdrawer.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_clips.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:super_admin/view/drawerpages/amenties/functions/dialogus.dart';
import 'package:super_admin/view/drawerpages/amenties/widgets/iconcard.dart';
import 'package:super_admin/view/drawerpages/amenties/widgets/requestediconcard.dart';

class MainAmenties extends StatefulWidget {
  const MainAmenties({super.key});

  @override
  State<MainAmenties> createState() => _AddReservationRoomDetailsState();
}

class _AddReservationRoomDetailsState extends State<MainAmenties> {
  @override
  final GlobalKey<SliderDrawerWidgetState> drawerKey = GlobalKey();
  AmentiesController controller = Get.put(AmentiesController());

  Widget build(BuildContext context) {
    return SliderDrawerWidget(
      key: drawerKey,
      option: SliderDrawerOption(
        // backgroundImage: toggleBackgroundState
        // ? Image.asset("assets/sample_background.jpg")
        // : Image.asset("assets/sample_background2.jpg"),
        backgroundColor: AppColors.blue,
        sliderEffectType: SliderEffectType.Rounded,
        upDownScaleAmount: 30,
        radiusAmount: 40,
        direction: SliderDrawerDirection.LTR,
      ),
      drawer:
          Container(margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
      body: SafeArea(
        child: Scaffold(
          appBar: CustomizableAppBar(
              title: "Hotel Icons",
              icon: Icons.add,
              ontapaction: () {
                showuploaddialogue();
              }),
          body: Container(
              margin: EdgeInsets.only(bottom: 20.sp),
              child: Column(
                children: [
                  SlideSwitcher(
                    first: 'Icons',
                    second: 'Requested Icons',
                    ontapfirst: () {
                      controller.pageswitcherstatus = 'first';
                      controller.update();
                    },
                    ontapsecond: () {
                      controller.pageswitcherstatus = 'second';
                      controller.update();
                    },
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color: AppColors.grey)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hotel',
                          style: AppTextStyle.main,
                        ),
                        Transform.rotate(
                          angle: -pi / 2,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.sp),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomClips(
                            name: 'Hotels',
                            iconasString: AppIcons.hotel,
                          ),
                          CustomClips(
                            name: 'Rooms',
                            iconasString: AppIcons.Activity,
                          ),
                          CustomClips(
                            name: 'Accounts',
                            iconasString: AppIcons.person,
                          ),
                          CustomClips(
                            name: 'Accounts',
                            iconasString: AppIcons.person,
                          ),
                          CustomClips(
                            name: 'Accounts',
                            iconasString: AppIcons.person,
                          ),
                          CustomClips(
                            name: 'Accounts',
                            iconasString: AppIcons.person,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<AmentiesController>(builder: (controller) {
                    return controller.pageswitcherstatus == 'first'
                        ? Flexible(
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    IconCard(),
                                    IconCard(),
                                    // IconCard(),
                                    // IconCard(),
                                    // IconCard(),
                                    // IconCard(),
                                    // IconCard(),
                                    // IconCard(),
                                    // IconCard(),
                                  ],
                                ),
                              ),
                              color: Colors.pink,
                            ),
                          )
                        : Flexible(
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    RequestedIconCard()
                                    // IconCard(),
                                  ],
                                ),
                              ),
                              color: Colors.pink,
                            ),
                          );
                  })

                  // SizedBox(
                  //   child: Expanded(
                  //       child: Container(
                  //     color: Colors.amber,
                  //     child: SingleChildScrollView(
                  //       physics: BouncingScrollPhysics(),
                  //       child: Column(
                  //         children: [
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //           IconCard(),
                  //         ],
                  //       ),
                  //     ),
                  //   )),
                  // )
                ],
              )),
        ),
      ),
    );
  }
}

class ShowCountriesDilaogue extends StatefulWidget {
  final String languageCode;
  final PickerDialogStyle? pickerDialogStyle;
  final List<Country>? countries;
  final AddHotelAccountController? controller;

  const ShowCountriesDilaogue(
      {super.key,
      required this.languageCode,
      this.pickerDialogStyle,
      this.countries,
      required this.controller});

  @override
  State<ShowCountriesDilaogue> createState() => _ShowCountriesDilaogueState();
}

class _ShowCountriesDilaogueState extends State<ShowCountriesDilaogue> {
  @override
  Widget build(BuildContext context) {
    Country selectedCountry = countries[0];
    Future<void> changeCountry() async {
      // filteredCountries = _countryList;

      if (mounted) setState(() {});
    }

    return Container(
      child: Clicable(
        child: Text("show countries"),
        ontap: () {
          changeCountry();
        },
      ),
    );
  }
}

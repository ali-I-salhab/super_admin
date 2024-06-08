import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:ionicons/ionicons.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/detailscontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/view/widgets/Homecard.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController sccontroller = ScrollController();
  DetailsController controller = Get.put(DetailsController());

  @override
  void initState() {
    super.initState();
    sccontroller.addListener(() {
      print(sccontroller.position.minScrollExtent);
      print(sccontroller.position.pixels);
    });
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size(100.w, 25.h),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: UnconstrainedBox(
                      child: Container(
                        width: 100.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 25.sp,
                                  color: Colors.black,
                                )),
                            Image.asset(ImageAssets.homelogo),
                            Badge(
                              offset: Offset(-9.w, 2.h),
                              label: Text("22"),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notifications_outlined,
                                    size: 30.sp,
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                  ),
                ],
              )),
          body: CustomScrollView(
            // physics: BouncingScrollPhysics(),
            // controller: sccontroller,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhysicalModel(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: SizedBox(
                        height: 30.h,
                        width: 90.w,
                        child: GetBuilder<DetailsController>(
                            builder: (controller) {
                          return Handlingdataview(
                              statusrequest: controller.getphotosstatusrequest,
                              widget: RoomStackimage(ontap: () {}, images: [
                                ...List.generate(
                                    controller.photos.length,
                                    (index) =>
                                        controller.photos[index].photoName!)
                              ]));
                        })),
                  ),
                ),
              ),
              // the tab bar with two itemssliver
              SliverToBoxAdapter(
                child: TabBar(
                  labelColor: Colors.red,
                  // labelStyle: TextStyle(fontSize: 40.sp),
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(
                      text: "Overview",
                      // icon: Icon(Icons.people),
                    ),
                    Tab(
                      text: "Rooms",
                      // icon: Icon(Icons.person),
                    )
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              // create widgets for each tab bar here
              SliverList.list(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // color: Colors.red,
                    child: SizedBox(
                      height: 130.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 70.h,
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    controller: sccontroller,
                                    physics: NeverScrollableScrollPhysics(),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.sp),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RatingStars(
                                                    editable: true,
                                                    rating: 3.5,
                                                    color: Colors.amber,
                                                    iconSize: 15.sp,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: '  start : ',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.blue),
                                                      children: const <TextSpan>[
                                                        TextSpan(
                                                            text: '10\$',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Reviews(),
                                                  Row(
                                                    children: [
                                                      Icon(Ionicons
                                                          .location_outline),
                                                      Text(" view location")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w, vertical: 1.h),
                                          width: double.infinity,
                                          height: 5.h,
                                          child: Center(
                                              child: Text("8 sep     10 oct")),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: AppColors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        UnconstrainedBox(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h),
                                            width: 60.w,
                                            height: 5.h,
                                            child: Center(
                                                child: Text(
                                              "Select a room",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.sp),
                                            )),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2,
                                          color: AppColors.grey,
                                        ),
                                        Text("ali salhas"),
                                        SingleChildScrollView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          child: Row(children: [
                                            Iconscard(),
                                            Iconscard(),
                                            Iconscard()
                                          ]),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 90.w,
                                            // color: Colors.red,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hotel Details",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        UnconstrainedBox(
                                          child: Container(
                                            // color: Colors.red,
                                            width: 90.w,
                                            height: 10.h,

                                            child: Text(
                                                maxLines: 4,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColors.grey,
                                                    overflow:
                                                        TextOverflow.fade),
                                                "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus...more "),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 90.w,
                                            // color: Colors.red,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Police",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 60.w,
                                            height: 10.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.blue)),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.sp),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "check-in",
                                                        style: TextStyle(
                                                            color:
                                                                AppColors.blue),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Ionicons
                                                                .timer_outline,
                                                            color:
                                                                AppColors.blue,
                                                          ),
                                                          Text(
                                                            "8:00 pm",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .blue),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "check-out",
                                                        style: TextStyle(
                                                            color:
                                                                AppColors.blue),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Ionicons
                                                                .timer_outline,
                                                            color:
                                                                AppColors.blue,
                                                          ),
                                                          Text(
                                                            "8:00 pm",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .blue),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 90.w,
                                            // color: Colors.red,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "location",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 90.w,
                                          height: 90.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.black,
                                              borderRadius:
                                                  BorderRadius.circular(30.sp)),
                                          child: Center(
                                            child: Text(
                                              "google map",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 90.w,
                                            // color: Colors.red,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Reviews",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4.5 ",
                                              style: TextStyle(fontSize: 44.sp),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Excellent"),
                                                Reviews()
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        // Get.toNamed(AppRoutes.testwidget);
                                      },
                                      child: Roomsdetailscard())
                                ],
                                controller: _tabController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ])
            ],
          )),
    );
  }
}

class Roomsdetailscard extends StatelessWidget {
  const Roomsdetailscard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black.withOpacity(0.001),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.blue)),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "check-in",
                          style: TextStyle(color: AppColors.blue),
                        ),
                        Row(
                          children: [
                            Icon(
                              Ionicons.timer_outline,
                              color: AppColors.blue,
                            ),
                            Text(
                              "8:00 pm",
                              style: TextStyle(color: AppColors.blue),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "check-out",
                          style: TextStyle(color: AppColors.blue),
                        ),
                        Row(
                          children: [
                            Icon(
                              Ionicons.timer_outline,
                              color: AppColors.blue,
                            ),
                            Text(
                              "8:00 pm",
                              style: TextStyle(color: AppColors.blue),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.9),
                      blurRadius: 5,
                      spreadRadius: 5,
                      blurStyle: BlurStyle.outer)
                ]),
            padding: EdgeInsets.all(4.sp),
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoomStackimage(ontap: () {}, images: [ImageAssets.roomex]),
                Text("Double Room"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.ac),
                            Text(" 2 adults"),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.ac),
                            Text(" 2 adults"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "125 EGP",
                          style: TextStyle(fontSize: 35.sp),
                        ),
                        Text(
                          "price per night",
                          style:
                              TextStyle(fontSize: 10.sp, color: AppColors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                Wrap(
                  spacing: 2.sp,
                  children: [
                    Chip(
                      labelPadding: EdgeInsets.only(left: 1.sp),
                      avatar: SvgPicture.asset(ImageAssets.ac),
                      label: Text("Ac"),
                    ),
                    Chip(
                      avatar: SvgPicture.asset(ImageAssets.ATM),
                      label: Text("ATm"),
                    ),
                    Chip(
                      avatar: SvgPicture.asset(ImageAssets.Bar),
                      label: Text("Bar"),
                    ),
                    Chip(
                      avatar: SvgPicture.asset(ImageAssets.Fitnesscentre),
                      label: Text("Fitnesscentre"),
                    ),
                    Chip(
                      avatar: SvgPicture.asset(ImageAssets.Parking),
                      label: Text("Parking"),
                    ),
                    Chip(
                      avatar: SvgPicture.asset(ImageAssets.Reciption),
                      label: Text("Reception"),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.sp, vertical: 3.sp),
                  child: Text(
                    "Meal plan",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "More details",
                      style: TextStyle(
                          color: AppColors.blue,
                          decoration: TextDecoration.combine(
                              [TextDecoration.underline])),
                    ),
                    Row(
                      children: [
                        Text("Rooms : "),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.sp, vertical: 3.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.blue)),
                          child: Text("-"),
                        ),
                        Container(
                          width: 40.sp,
                          margin: EdgeInsets.symmetric(horizontal: 4.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.sp, vertical: 3.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.grey)),
                          child: Center(child: Text("1")),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.sp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.sp, vertical: 3.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.blue)),
                          child: Text("+"),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Iconscard extends StatelessWidget {
  const Iconscard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: Column(
      children: [
        Container(
          height: 6.h,
          width: 6.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.greytextformfield),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              ImageAssets.Wifi,
              width: 5.w,
              height: 5.w,
            ),
          ),
        ),
        Text("wifi"),
      ],
    ));
  }
}

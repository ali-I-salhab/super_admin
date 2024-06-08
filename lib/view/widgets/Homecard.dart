import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_list_picker/country_list_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:super_admin/Apiapplink.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class HomeRoomImagecard extends StatefulWidget {
  final GestureDragCancelCallback ontap;
  final List<String> images;
  final String name;
  final String rate;
  final String price;
  final String image;
  const HomeRoomImagecard(
      {super.key,
      required this.images,
      required this.ontap,
      required this.name,
      required this.rate,
      required this.price,
      required this.image});

  @override
  State<HomeRoomImagecard> createState() => _HomeRoomImagecardState();
}

class _HomeRoomImagecardState extends State<HomeRoomImagecard> {
  var _currentRangeValues = RangeValues(40, 80);
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.only(top: 10.sp),
          width: 90.w,
          child: PhysicalModel(
            shadowColor: Colors.black,
            elevation: 9,
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoomStackimage(ontap: widget.ontap, images: [widget.image]),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: AppColors.black, height: 2, fontSize: 16.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: TextStyle(color: AppColors.blue),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: widget.price,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Reviews(),
                            Row(
                              children: [
                                Icon(Ionicons.location_outline),
                                Text(
                                  " view location",
                                  style: TextStyle(color: AppColors.blue),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Ionicons.eye_outline),
        ...List.generate(
            5,
            (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.1.w),
                  height: 1.2.h,
                  width: 1.2.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green,
                  ),
                )),
        Text(
          " 477 Reviews",
          style: TextStyle(color: AppColors.grey, fontSize: 10.sp),
        )
      ],
    );
  }
}

class RoomStackimage extends StatefulWidget {
  final GestureDragCancelCallback ontap;
  final List<String> images;
  RoomStackimage({super.key, required this.ontap, required this.images});

  @override
  State<RoomStackimage> createState() => _RoomStackimageState();
}

class _RoomStackimageState extends State<RoomStackimage> {
  final pageController = PageController(viewportFraction: 0.9);
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    print("imaggggggggggggggggges");
    print(widget.images);
    return Container(
      height: 30.h,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          PageView.builder(
              controller: pageController,
              onPageChanged: (i) {
                setState(() {
                  _counter = i;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return FractionallySizedBox(
                  widthFactor: 1 / pageController.viewportFraction,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1.sp),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '${ApiApplinks.roomimagesfolder}' +
                            widget.images[index],
                      ),
                    ),
                  ),
                );
              }),
          Positioned(
              top: 10.sp,
              right: 10.sp,
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
                size: 20.sp,
              )),
          Positioned(
              bottom: 4.w,
              child: Row(
                children: [
                  ...List.generate(
                      widget.images.length,
                      (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: _counter == index ? 10 : 5,
                            width: 10,
                            decoration: BoxDecoration(
                                color: _counter == index
                                    ? Colors.white.withOpacity(0.8)
                                    : Colors.white,
                                shape: BoxShape.circle),
                          ))
                ],
              )),
        ],
      ),
    );
  }
}

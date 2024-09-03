import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/hompage/homepagecontroller.dart';
import 'package:super_admin/core/constants/colors.dart';

class AppBarGod extends StatefulWidget {
  const AppBarGod({super.key});

  @override
  State<AppBarGod> createState() => _AppBarGodState();
}

class _AppBarGodState extends State<AppBarGod> {
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    HomePageController controller = Get.find();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 5.sp),
      height: _width * .155,
      decoration: BoxDecoration(
        color: AppColors.main,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.11),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: _width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(
              () {
                currentIndex = index;
                controller.currentindex = index;
                controller.update();
              },
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == currentIndex ? 0 : _width * .029,
                  right: _width * .0422,
                  left: _width * .0422,
                ),
                width: _width * .128,
                height: index == currentIndex ? _width * .017 : 0,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
              Icon(
                listOfIcons[index],
                size: _width * .076,
                color: index == currentIndex ? Colors.white : Colors.grey,
              ),
              SizedBox(height: _width * .03),
            ],
          ),
        ),
      ),
    );
  }
}

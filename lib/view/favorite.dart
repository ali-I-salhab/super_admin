import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:sizer/sizer.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  gradient:
                      LinearGradient(colors: [Colors.black, Colors.white])),
            ),
            centerTitle: true,
            title: Text(
              "Favorites",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
          ),
        ),
        SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text("data");
              // return HomeRoomImagecard(
              //   ontap: () {
              //     Get.toNamed(AppRoutes.details);
              //   },
              //   images: [
              //     ImageAssets.roomex,
              //     ImageAssets.roomex,
              //     ImageAssets.roomex,
              //   ],
              //   name: '',
              //   rate: '',
              //   price: '',
              //   image: '',
              // );
            }),
      ],
    );
  }
}

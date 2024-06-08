import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/homecontroller.dart';
import 'package:super_admin/controller/homepagecontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/view/fucntions/showmodalfilteriingbottomsheet.dart';
import 'package:super_admin/view/widgets/Homecard.dart';

class Home extends GetView<HomepageController> {
  Home({super.key});
  Homecontroller controllerr = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    print("00000000000000000000000000000");
    controllerr.rooms.length == 0 ? controllerr.onInit() : null;

    return RefreshIndicator(
      onRefresh: () async {
        await controllerr.getallrooms();
      },
      child: GetBuilder<Homecontroller>(
        builder: (cc) {
          return Handlingdataview(
              statusrequest: cc.getroomsstatusrequest,
              widget: CustomScrollView(
                controller: controller.scroller,
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    forceElevated: true,
                    foregroundColor: Colors.amber,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,

                    stretch: true,
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        stretchModes: [StretchMode.zoomBackground],
                        background: ClipRRect(
                          child: Transform.flip(
                            child: Image.asset(
                              ImageAssets.background2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),

                    toolbarHeight: 100.0 + kToolbarHeight,

                    /// based on your desing
                    title: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Search products...",
                                border: InputBorder.none,
                                icon: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.search)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.map_outlined),
                                      Text(
                                        "maps",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Showfilteringbottomsheet(context);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.filter),
                                        Text(
                                          "Filtering",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final dio = Dio();
                                      final response = await dio.post(
                                        'https://jsonplaceholder.typicode.com/posts',
                                      );
                                      print(response.data);
                                      // // HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
                                      // Dio dio = new Dio();
                                      // dio.options.headers[
                                      //         'HttpHeaders.contentTypeHeader'] =
                                      //     'application/x-www-form-urlencoded';

                                      // var res = await dio.post(
                                      //     "https://alisalhabqq11.000webhostapp.com/customer/Home/getroomsimages.php",
                                      //     data: jsonEncode({"roomid": 63}),
                                      //     options: Options(headers: {
                                      //       'Accept': 'application/json',
                                      //       // 'Authorization': 'Bearer ' + bearerToken
                                      //     }));

                                      // print(res);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Ionicons.reorder_two_sharp,
                                        ),
                                        Text(
                                          "Ranging",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),

                    expandedHeight: 20.h,
                  ),
                  SliverList.builder(
                      itemCount: controllerr.rooms.length,
                      itemBuilder: (context, index) {
                        return HomeRoomImagecard(
                          ontap: () {
                            Get.toNamed(AppRoutes.details,
                                arguments: {"room": controllerr.rooms[index]});
                          },
                          images: [
                            ImageAssets.roomex,
                            ImageAssets.roomex,
                            ImageAssets.roomex,
                          ],
                          name: controllerr.rooms[index].roomName!,
                          rate: controllerr.rooms[index].roomName!,
                          price: controllerr.rooms[index].roomAdult!,
                          image: controllerr.rooms[index].roomLogo!,
                        );
                      }),
                ],
              ));
        },
      ),
    );
  }
}

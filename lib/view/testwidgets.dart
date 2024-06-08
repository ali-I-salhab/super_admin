// /**
//  * Author: Damodar Lohani
//  * profile: https://github.com/lohanidamodar
//   */

// import 'package:flutter/material.dart';
// import 'package:holiday/core/constants/imageassets.dart';
// import 'package:sizer/sizer.dart';

// class TestWidget extends StatelessWidget {
//   static const String path = "lib/src/pages/hotel/details.dart";
//   final String image = ImageAssets.room;

//   TestWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.cyan,
//         child: Stack(
//           children: <Widget>[
//             Container(
//                 // foregroundDecoration: const BoxDecoration(color: Colors.red),
//                 height: 60.h,
//                 child: Image.asset(image, fit: BoxFit.cover)),
//             SingleChildScrollView(
//               padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
//               child: Container(
//                 // color: Colors.black,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                         height: 40.h,
//                         foregroundDecoration: BoxDecoration(color: Colors.red),
//                         child: Text("dddddddddddddddddddddddddddddd")),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         "Lux Hotel\nToronto",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 28.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Row(
//                       children: <Widget>[
//                         const SizedBox(width: 16.0),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 8.0,
//                             horizontal: 16.0,
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(20.0)),
//                           child: const Text(
//                             "8.4/85 reviews",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 13.0),
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           color: Colors.white,
//                           icon: const Icon(Icons.favorite_border),
//                           onPressed: () {},
//                         )
//                       ],
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(32.0),
//                       color: Colors.white,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     const Text.rich(
//                                       TextSpan(children: [
//                                         WidgetSpan(
//                                             child: Icon(
//                                           Icons.location_on,
//                                           size: 16.0,
//                                           color: Colors.grey,
//                                         )),
//                                         TextSpan(text: "8 km to centrum")
//                                       ]),
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 12.0),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 children: const <Widget>[],
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 30.0),
//                           const SizedBox(height: 30.0),
//                           Text(
//                             "Description".toUpperCase(),
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w600, fontSize: 14.0),
//                           ),
//                           const SizedBox(height: 10.0),
//                           const Text(
//                             "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
//                             textAlign: TextAlign.justify,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300, fontSize: 14.0),
//                           ),
//                           const SizedBox(height: 10.0),
//                           const Text(
//                             "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
//                             textAlign: TextAlign.justify,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300, fontSize: 14.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: AppBar(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 centerTitle: true,
//                 title: const Text(
//                   "DETAIssssssssssssssL",
//                   style:
//                       TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: BottomNavigationBar(
//                 backgroundColor: Colors.white54,
//                 elevation: 0,
//                 selectedItemColor: Colors.black,
//                 items: const [
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.search), label: "Search"),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.favorite_border), label: "Favorites"),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.settings), label: "Settings"),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/view/test.dart';

class AvocadoPage extends StatelessWidget {
  static const String path = "lib/src/pages/food/avocado.dart";
  final String image = ImageAssets.room;

  AvocadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 450,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: NetworkImage(image), fit: BoxFit.cover)),
          ),
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Avocado",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "\$1.80 / Kg",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "100 gms for 1-2 pieces",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const Spacer(),
                      Icon(
                        FontAwesomeIcons.fire,
                        size: 14.0,
                        color: Colors.pink.shade300,
                      ),
                      const Text("160"),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Slider(
                    onChanged: (value) {},
                    min: 1,
                    max: 5,
                    value: 1.5,
                  ),
                  Row(
                    children: <Widget>[
                      Text("1.5 kg (12-14 pieces approx.)",
                          style: TextStyle(color: Colors.grey.shade700)),
                      const Spacer(),
                      const Text(
                        "\$ 2.70",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          backgroundColor: Colors.pink.shade200,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Add to Cart"),
                        onPressed: () {},
                      )),
                  const SizedBox(height: 10.0),
                  const Center(child: Icon(Icons.keyboard_arrow_up)),
                  Center(
                    child: Text(
                      "Know More",
                      style: TextStyle(color: Colors.pink.shade300),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 40,
            child: LikeButton(),
          )
        ],
      ),
    );
  }
}

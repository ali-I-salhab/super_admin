import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:path_provider/path_provider.dart';
import 'package:super_admin/Unknown.dart';
import 'package:super_admin/core/binging/initialbindings.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/routes.dart';
import 'package:super_admin/sizeconfig.dart';
// import 'package:uni_links/uni_links.dart';

import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';
import 'package:sizer/sizer.dart';
import 'package:hive/hive.dart';

// flutter build apk --split-per-abi
// flutter pub add time_range_picker
// flutter pub add image_editor
Box? services;
Box? sections;
Future<Box> openhivebox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return Hive.openBox(boxname);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  services = await openhivebox("services");
  sections = await openhivebox("sections");
  await initialservizes();
  // final FirebaseMessaging msg = FirebaseMessaging.instance;
  // msg.getToken().then((value) => print("token : $value"));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late StreamSubscription _sub;
  // String? _incomingLink;

  // @override
  // void initState() {
  //   print('object');
  //   _sub = linkStream.listen((String? link) {
  //     if (link != null) {
  //       print('linkkkkkkkkkkkkkkkkkkkk');

  //       // Parse the link and navigate to the appropriate page
  //       Uri uri = Uri.parse(link);
  //       print(uri.pathSegments);
  //       if (uri.pathSegments.length == 3 && uri.pathSegments[0] == 'activate') {
  //         print("go to activate page");
  //         String uid =
  //             uri.pathSegments[1]; // Assuming uid is the second segment
  //         String token = uri.queryParameters['token'] ??
  //             ''; // Assuming token is a query parameter
  //         // /activate/:${uid}/:${token}

  //         // Get.toNamed('/activate', arguments: {"uid": 'uid', "token": token});
  //       }
  //     }
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    // _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("---------------------------widgdd");

    SizeConfig().init(context);

    Localcontroller controller = Get.put(Localcontroller());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        routingCallback: (routr) {
          print("routingCallback---------------->$routr");
        },
        unknownRoute: GetPage(name: "/unkown", page: () => Unknown()),
        locale: Locale("en"),
        translations: MyTranslation(),
        // routes: AppRoutes(),

        getPages: getPages,
        initialRoute: '/signup',

        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        // home: Stopsale(),
        theme: controller.appthem,
      );
    });
  }
}

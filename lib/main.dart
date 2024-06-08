import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:super_admin/core/binging/initialbindings.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/routes.dart';
import 'package:super_admin/sizeconfig.dart';

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

  runApp(const MyApp());
}

// all to done

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Localcontroller controller = Get.put(Localcontroller());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        locale: Locale("en"),
        translations: MyTranslation(),
        // routes: AppRoutes(),

        initialRoute: "/signup",
        getPages: getPages,
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        // home: Stopsale(),
        theme: controller.appthem,
      );
    });
  }
}

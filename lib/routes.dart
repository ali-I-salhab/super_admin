import 'package:get/get.dart';

import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/middleware/mymiddleware.dart';
import 'package:super_admin/notifications.dart';
import 'package:super_admin/view/auth/signup.dart';
import 'package:super_admin/view/auth/successsignup.dart';
import 'package:super_admin/view/detilspagee.dart';
import 'package:super_admin/view/forgetpassword/verifycodeforgetpassword.dart';
import 'package:super_admin/view/homepahe.dart';
import 'package:super_admin/view/onboarding/onboarding.dart';

import 'view/testwidgets.dart';

List<GetPage<dynamic>>? getPages = [
  // GetPage(
  //     name: AppRoutes.login,
  //     page: () => Login(),
  //     middlewares: [MyMiddleware()]),
  GetPage(
      name: AppRoutes.signup,
      page: () => Signup(),
      middlewares: [MyMiddleware()]),

  GetPage(
      name: AppRoutes.onboarding,
      page: () => const Onboarding(),
      middlewares: [Onboardingmiddleware()]),
  GetPage(
    name: AppRoutes.success,
    page: () => SuccessSignup(),
  ),

  GetPage(name: AppRoutes.verifycode, page: () => VerifycodeForgetpassword()),
  GetPage(name: AppRoutes.testwidget, page: () => AvocadoPage()),

  GetPage(name: AppRoutes.homepage, page: () => Homepage()),
  GetPage(name: AppRoutes.details, page: () => Details()),
  GetPage(name: AppRoutes.notifications, page: () => Notifications()),
  // GetPage(name: AppRoutes.addhotel, page: () => Addhotel()),
];

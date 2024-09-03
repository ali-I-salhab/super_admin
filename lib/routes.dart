import 'package:get/get.dart';

import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/middleware/mymiddleware.dart';
import 'package:super_admin/notifications.dart';
import 'package:super_admin/view/Homepage/homepage.dart';
import 'package:super_admin/view/auth/activateaccount.dart';
import 'package:super_admin/view/auth/login.dart';
import 'package:super_admin/view/auth/resetpasswordconfirmation.dart';
import 'package:super_admin/view/auth/signup.dart';
import 'package:super_admin/view/auth/resetpassword.dart';
import 'package:super_admin/view/detilspagee.dart';
import 'package:super_admin/view/drawerpages/addacount/AccountApproval.dart';
import 'package:super_admin/view/drawerpages/addacount/ContractAttachment.dart';
import 'package:super_admin/view/drawerpages/addacount/addacount.dart';
import 'package:super_admin/view/drawerpages/addacount/addhotelaccount.dart';
import 'package:super_admin/view/drawerpages/addacount/availabilityandrateprovider.dart';
import 'package:super_admin/view/drawerpages/addacount/departmentcontactdetails.dart';
import 'package:super_admin/view/drawerpages/addacount/minimumcommisions.dart';
import 'package:super_admin/view/drawerpages/addacount/payment.dart';
import 'package:super_admin/view/drawerpages/amenties/mainamenties.dart';
import 'package:super_admin/view/drawerpages/manualreservation/addcustomerdetails.dart';
import 'package:super_admin/view/drawerpages/manualreservation/addreservation.dart';
import 'package:super_admin/view/drawerpages/manualreservation/bedoptions.dart';
import 'package:super_admin/view/drawerpages/manualreservation/completedbooking.dart';
import 'package:super_admin/view/drawerpages/manualreservation/confirmedreservation.dart';
import 'package:super_admin/view/drawerpages/manualreservation/guestoption.dart';
import 'package:super_admin/view/drawerpages/manualreservation/mainmanualreservation.dart';
import 'package:super_admin/view/drawerpages/manualreservation/payout.dart';
import 'package:super_admin/view/drawerpages/manualreservation/requestedreservation.dart';
import 'package:super_admin/view/drawerpages/manualreservation/roomdetails.dart';
import 'package:super_admin/view/drawerpages/manualreservation/rooms.dart';
import 'package:super_admin/view/drawerpages/manualreservation/waitingreservation.dart';
import 'package:super_admin/view/forgetpassword/verifycodeforgetpassword.dart';
import 'package:super_admin/view/onboarding/onboarding.dart';

import 'view/testwidgets.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: "/activate/",
    page: () => ActivateAccountPage(),
  ),
  GetPage(
    name: "/password/reset/confirm/",
    page: () => ResetPasswordConfirmation(),
  ),
  GetPage(
      name: AppRoutes.login,
      page: () => Login(),
      middlewares: [MyMiddleware()]),
// ContractAttachment
  GetPage(
    name: AppRoutes.ContractAttachment,
    page: () => const ContractAttachment(),
  ),
  GetPage(
    name: AppRoutes.Addreservation,
    page: () => const Addreservation(),
  ),
  GetPage(
    name: AppRoutes.AccountApproval,
    page: () => const AccountApproval(),
  ),
  GetPage(
    name: AppRoutes.MinimumCommissions,
    page: () => const MinimumCommissions(),
  ),
  GetPage(
    name: AppRoutes.payment,
    page: () => const Payment(),
  ),
  GetPage(
      name: AppRoutes.signup,
      page: () => Signup(),
      middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.AvailabilityAndRateProvider,
    page: () => const AvailabilityAndRateProvider(),
  ),
  GetPage(
    name: AppRoutes.departmentcontactdetials,
    page: () => const DepartmentContactDetails(),
  ),
  GetPage(
      name: AppRoutes.onboarding,
      page: () => const Onboarding(),
      middlewares: [Onboardingmiddleware()]),
  GetPage(
    name: AppRoutes.success,
    page: () => SuccessSignup(),
  ),
  GetPage(
    name: AppRoutes.addhotelaccount,
    page: () => AddHotelAccount(),
  ),
  GetPage(
    name: AppRoutes.addaccount,
    page: () => AddAccount(),
  ),

  GetPage(name: AppRoutes.verifycode, page: () => VerifycodeForgetpassword()),
  GetPage(name: AppRoutes.testwidget, page: () => AvocadoPage()),

  GetPage(name: AppRoutes.homepage, page: () => HomePage()),
  GetPage(name: AppRoutes.details, page: () => Details()),
  GetPage(name: AppRoutes.notifications, page: () => Notifications()),
  // GetPage(name: AppRoutes.addhotel, page: () => Addhotel()),

  GetPage(
    name: AppRoutes.RequestedReservation,
    page: () => const RequestedReservation(),
  ),
  GetPage(
    name: AppRoutes.WaitingReservation,
    page: () => const WaitingReservation(),
  ),
  GetPage(
    name: AppRoutes.AddReservationRoomDetails,
    page: () => const AddReservationRoomDetails(),
  ),
  GetPage(
    name: AppRoutes.AddCustomerDetails,
    page: () => const AddCustomerDetails(),
  ),
  GetPage(
    name: AppRoutes.AddReservationRooms,
    page: () => const AddReservationRooms(),
  ),
  GetPage(
    name: AppRoutes.AddreservationBedOptions,
    page: () => const AddreservationBedOptions(),
    // AddReservatonGuestoptions
  ),
  GetPage(
    name: AppRoutes.AddReservatonGuestoptions,
    page: () => const AddReservatonGuestoptions(),
    // AddReservatonGuestoptions
  ),
  GetPage(
    name: AppRoutes.MainManualReservation,
    page: () => const MainManualReservation(),
    // AddReservatonGuestoptions
  ),

  GetPage(
    name: AppRoutes.WaitingReservations,
    page: () => const WaitingReservation(),
    // AddReservatonGuestoptions
  ),
  GetPage(
    name: AppRoutes.Payout,
    page: () => const Payout(),
    // AddReservatonGuestoptions
  ),
  GetPage(
    name: AppRoutes.CompleteBooking,
    page: () => const CompleteBooking(),
    // AddReservatonGuestoptions
  ),

  GetPage(
    name: AppRoutes.ConfirmededReservation,
    page: () => const ConfirmededReservation(),
    // AddReservatonGuestoptions
  ),
  GetPage(
    name: AppRoutes.MainAmenties,
    page: () => const MainAmenties(),
    // AddReservatonGuestoptions
  ),
];

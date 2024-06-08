import 'package:super_admin/core/constants/route.dart';
import 'package:get/get.dart';

abstract class SuccessSignupController extends GetxController {
  gotologinpage();
}

class SuccessSignupControllerImp extends SuccessSignupController {
  @override
  gotologinpage() {
    Get.offAllNamed(
      AppRoutes.signup,
    );
  }
}

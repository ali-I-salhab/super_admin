import 'package:get/get.dart';
import 'package:super_admin/core/services/services.dart';

translatedatabase(columnAR, columnEN) {
  var services = Get.find<MyServices>();
  String lan = services.shared.getString('lang').toString();
  if (lan == 'ar') {
    return columnAR;
  } else {
    return columnEN;
  }
}

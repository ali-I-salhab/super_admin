import 'package:get/get.dart';
import 'package:super_admin/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}

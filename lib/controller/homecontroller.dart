import 'package:get/get.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/functions/handlingdata.dart';
import 'package:super_admin/data/datasource/remote/home/homedata.dart';
import 'package:super_admin/data/model/roommodel.dart';

class Homecontroller extends GetxController {
  List<RoomModel> rooms = [];
  Statusrequest getroomsstatusrequest = Statusrequest.none;
  HomeData homedata = HomeData(Get.find());
  getallrooms() async {
    rooms = [];
    getroomsstatusrequest = Statusrequest.loading;
    update();
    var response = await homedata.getrooms();

    getroomsstatusrequest = handlingdata(response);
    update();

    if (getroomsstatusrequest == Statusrequest.success) {
      // we get map
      if (response["status"] == "success") {
        List a = response['data'];
        rooms.addAll(a.map((e) => RoomModel.fromJson(e)));
        print(rooms);
      } else {
        // here we get empty map
        getroomsstatusrequest = Statusrequest.failure;
        update();
      }
    }
  }

  @override
  void onInit() {
    getallrooms();
    // TODO: implement onInit
    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/functions/handlingdata.dart';
import 'package:super_admin/data/datasource/remote/home/detailsdata.dart';
import 'package:super_admin/data/model/photomodel.dart';
import 'package:super_admin/data/model/roommodel.dart';

class DetailsController extends GetxController {
  DetailsData detailsdata = DetailsData(Get.find());
  Statusrequest getphotosstatusrequest = Statusrequest.none;
  List<PhotoModel> photos = [];
  RoomModel? room;

  getroomimages(String roomid) async {
    getphotosstatusrequest = Statusrequest.loading;
    update();
    var response = await detailsdata.getroomsimages(roomid);

    getphotosstatusrequest = handlingdata(response);
    update();

    if (getphotosstatusrequest == Statusrequest.success) {
      // we get map
      if (response["status"] == "success") {
        List a = response['data'];
        photos.addAll(a.map((e) => PhotoModel.fromJson(e)));

        print(photos.map((e) => e.photoName));
      } else {
        // here we get empty map
        getphotosstatusrequest = Statusrequest.failure;
        update();
      }
    }
  }

  @override
  void onInit() {
    room = Get.arguments["room"];
    getroomimages(room!.roomId!);
    // TODO: implement onInit;
    super.onInit();
  }
}

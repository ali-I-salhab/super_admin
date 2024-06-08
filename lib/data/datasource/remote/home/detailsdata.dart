import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class DetailsData {
  Crud crud;
  DetailsData(this.crud);

  getroomsimages(String roomid) async {
    var response =
        await crud.postdata(ApiApplinks.getroomphoto, {"roomid": roomid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

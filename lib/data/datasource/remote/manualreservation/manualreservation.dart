import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class ManualReservationData {
  Crud crud;
  ManualReservationData(this.crud);

  postdata() async {
    var response = await crud.getdata(ApiApplinks.test);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

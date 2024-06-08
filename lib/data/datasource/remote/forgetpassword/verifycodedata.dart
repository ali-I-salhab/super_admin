import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class Verifycodedata {
  Crud crud;
  Verifycodedata(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postdata(ApiApplinks.verifycodeforget,
        {"email": email, "verifycode": verifycode});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

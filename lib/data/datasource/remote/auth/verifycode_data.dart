import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postdata(ApiApplinks.verifycode, {
      "verifycode": verifycode,
      "email": email,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

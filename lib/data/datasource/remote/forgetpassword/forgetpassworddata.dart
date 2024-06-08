import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class ForgetpasswordData {
  Crud crud;
  ForgetpasswordData(this.crud);

  postdata(String email) async {
    var response = await crud.postdata(ApiApplinks.forgetpassword, {
      "email": email,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

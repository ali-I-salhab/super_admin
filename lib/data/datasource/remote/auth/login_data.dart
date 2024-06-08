import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postdata(String email, String password) async {
    var response = await crud
        .postdata(ApiApplinks.login, {"email": email, "password": password});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

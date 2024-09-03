import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postdata(
        ApiApplinks.login, {"email": email, "password": password}, true);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  activateaccount(String uid, String token) async {
    var response = await crud.postdata(
        ApiApplinks.activate, {"uid": uid, "token": token}, true);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  resetpassword(String email) async {
    var response = await crud.postdata(
        ApiApplinks.reset_password,
        {
          "email": email,
        },
        true);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  resetpasswordconfirmation(
      String uid, String token, String newpassword) async {
    var response = await crud.postdata(
        ApiApplinks.reset_password_confirmation,
        {
          "uid": uid,
          "token": token,
          "new_password": newpassword,
        },
        true);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

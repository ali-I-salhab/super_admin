import 'package:get/get.dart';

validate(String val, int min, int max, String type) {
  if (type == 'password') {
    if (val.isEmpty) {
      return 'field cant be empty';
    }
    if (val.length > max) {
      return 'password length cant be bigger than $max';
    }
    if (val.length < min) {
      return 'password length cant be less than $min';
    }
    // if (!val.contains(RegExp(r"[a-z]|[A-Z]")) ||
    //     !val.contains(RegExp(r"[0-9]"))) {
    //   return 'password showd contains letters and numbers';
    // }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'invalid phone number ';
    }
  }
  if (type == 'username') {
    if (val.isEmpty) {
      return 'field cant be empty';
    }
    if (val.length > max) {
      return 'value length cant be bigger than $max';
    }
    if (val.length < min) {
      return 'value length cant be less than $min';
    }

    if (!GetUtils.isUsername(val.trim())) {
      // print("fgfgf");
      return 'invalid username ';
    }
  }
  if (type == 'email') {
    if (val.isEmpty) {
      return 'field cant be empty';
    }

    if (!GetUtils.isEmail(val.trim())) {
      // print("fgfgf");
      return 'invalid username ';
    }
  }
}

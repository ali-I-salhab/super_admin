class ApiApplinks {
  // http://127.0.0.1:8000/booking/manualreservation/1/
  static const server = 'http://192.168.1.11:8000/booking/';
  static const serverimage = 'http://192.168.1.11:8000/';

  static const me = serverimage + "auth/users/me/";
  static const String login = 'http://192.168.1.11:8000/auth/jwt/create/';
  static const String activate =
      "http://192.168.1.11:8000/auth/users/activation/";

  static const String reset_password =
      'http://192.168.1.11:8000/auth/users/reset_password/';

  static const String reset_password_confirmation =
      'http://192.168.1.11:8000/auth/users/reset_password_confirm/';

  static const String signup = 'http://192.168.1.11:8000/auth/users/';
  static const String hotels = server + 'hotels/';

  // "https://alisalhabqq11.000webhostapp.com/";
  static const roomimagesfolder = server + "upload/roomimages/";
  static const profilesimagefolder = server + "upload/usersprofileimages/";
  static const String forgetpassword =
      server + "forgetpassword/forgetpassword.php";
  static const String resetpassword =
      server + "forgetpassword/resetpassword.php";
  static const String verifycodeforget =
      server + "forgetpassword/verifycode.php";
  // auth

  static const String verifycode = server + "customer/auth/verifycode.php";
  static const String getrooms = server + "customer/Home/viewrooms.php";
  static const String getroomphoto =
      server + "customer/Home/getroomsimages.php";
  static const String test = server + "manualreservation/";
}
// addhotel/hotelphotosview.php
// https://alisalhabqq11.000webhostapp.com/auth/login.php
// rooms/add.php
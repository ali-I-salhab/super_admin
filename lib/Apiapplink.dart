class ApiApplinks {
  // http://127.0.0.1:8000/booking/manualreservation/1/
  static const server = 'http://ali33salhab.pythonanywhere.com/booking/';
  static const serverimage = 'http://ali33salhab.pythonanywhere.com/';
  // static const hotelimages = 'http://ali33salhab.pythonanywhere.com';
  static const hotelimages =
      "https://www.pythonanywhere.com/user/ali33salhab/files/home/ali33salhab/deployingbookingapp";
// https://www.pythonanywhere.com/user/ali33salhab/files/home/ali33salhab/deployingbookingapp/media/hotel/photos/Screenshot_20240903-055614_Facebook_4FeMRtU.png
  static const me = serverimage + "users/me/";
  static const String login = serverimage + "auth/jwt/create/";
  static const String activate = serverimage + "auth/users/activation/";

  static const String reset_password =
      '$serverimage+auth/users/reset_password/';

  static const String reset_password_confirmation =
      '$serverimage+auth/users/reset_password_confirm/';

  static const String signup = serverimage + 'auth/users/';
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
  static const String ulploadexcelfile = server + "transformers/";
}
// addhotel/hotelphotosview.php
// https://alisalhabqq11.000webhostapp.com/auth/login.php
// rooms/add.php
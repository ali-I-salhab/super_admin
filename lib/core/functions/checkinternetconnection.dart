import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

checkinternetstatus() async {
  // bool result = await InternetConnectionChecker().hasConnection;
  // return result;

  // try {
  //   final result = await InternetAddress.lookup("www.google.com");
  //   print(
  //       "----------------------------internnnnnetttttttt connectio status ------------------------");
  //   print(result[0]);

  //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //     print("cheched internet return true");
  //     return true;
  //   }
  // } on SocketException catch (_) {
  //   print("cheched internet return false");
  //   Get.snackbar("Error", "No internet connection please try again later !",
  //       duration: Duration(seconds: 7));

  //   return false;

  // Platform messages are asynchronous, so we initialize in an async method.

  // late ConnectivityResult result;
  // // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();

  // // Platform messages may fail, so we use a try/catch PlatformException.
  // try {
  //   result = await _connectivity.checkConnectivity();
  //   print(result);

  // } on PlatformException catch (e) {
  //   developer.log('Couldn\'t check connectivity status', error: e);
  //   return;
  // }
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
    // I am connected to a mobile network.
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
    // I am connected to a wifi network.
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    return true;
    // I am connected to a ethernet network.
  } else if (connectivityResult == ConnectivityResult.vpn) {
    return true;
  } else {
    return false;
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.

//
}
// print("check internet connection from new method =-======>");
// try {
//   final result = await http.get(Uri.parse('https://www.google.com')).timeout(
//     Duration(seconds: 15),
//     onTimeout: () {
//       print("sssssssssssssssssssss");
//       // Time has run out, do what you wanted to do.

//       return http.Response(
//           'Error', 408); // Request Timeout response status code
//     },
//   );
//   // if (result.statusCode == 101) {
//   //   return false;
//   // }
//   print(result.statusCode);

//   if (result.statusCode == 200 || result.statusCode == 201) {
//     return true;
//   } else {
//     return false;
//   }
// } on TimeoutException catch (_) {
//   return false;
// } on SocketException catch (_) {
//   return false;
// } catch (_client) {
//   print("third exeption");
//   return false;
// }

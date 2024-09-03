import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/functions/handlingdata.dart';
import 'package:super_admin/core/services/services.dart';
import 'package:super_admin/data/datasource/remote/addaccountdata/addacountdata.dart';
import 'package:super_admin/data/model/hotelmodel.dart';

class AddAccountController extends GetxController {
  List<HotelModel> hotels = [];
  Statusrequest statusrequest = Statusrequest.none;
  AddAccountData accountData = AddAccountData(Get.find());
  File? uplodedexcelfile;
  uploadexcelfiles() async {
    print('uploading files function');
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));
    await Future.delayed(Duration(seconds: 5));

    var response = await accountData.uploadexcelfiles(uplodedexcelfile!);
    print(response);
    Get.back();
    if (response['status'] == 'success') {
      // await viewhotels();
    } else {}

    print(response);

  }

  viewhotels() async {
    print('Getting data');
    statusrequest = Statusrequest.loading;
    update();
    var response = await accountData.gethotles();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List data = response['data'];
        hotels.addAll(data.map((e) => HotelModel.fromJson(e)));
        print(hotels);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  deletehotel(String hotelid) async {
    print('Getting data');
    statusrequest = Statusrequest.loading;
    update();
    var response = await accountData.deletehotle(hotelid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print(response);
        print("delete hotel successfully");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    MyServices ser = Get.find();
    bool isTokenExpired =
        JwtDecoder.isExpired(ser.shared.getString("accesstoken")!);
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(ser.shared.getString("accesstoken")!);
    print(decodedToken);
    print(isTokenExpired);

    print("==================token validate if expired ");
    print('init add account controller ----------->');
    viewhotels();
    // TODO: implement onInit
    super.onInit();
  }
}
import 'dart:ffi';
import 'dart:io';

import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_admin/controller/addacount/addaccontcontroller.dart';
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/handlingdata.dart';
import 'package:super_admin/data/datasource/remote/addaccountdata/addacountdata.dart';
import 'package:super_admin/data/model/hotelmodel.dart';
import 'package:super_admin/data/model/photomodel.dart';
import 'package:path/path.dart' as p;

class AddHotelAccountController extends GetxController {
  HotelModel? hotel;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Country? selectedcountry;
  RxString activepayment = "".obs;
  double hotelstars = 0.0;
  RxString availabilityandrateprovider = "".obs;
  RxBool isloading = false.obs;
  File? contract_attachement;
  List<File>? contract_attachement_files = [];
  List<File>? photos = [];

  TextEditingController? name;
  TextEditingController? username;

  TextEditingController? password;

  TextEditingController? country;
  TextEditingController? city;
  TextEditingController? phone;
  TextEditingController? googlereview;
  TextEditingController? b2b;

  TextEditingController? b2c;

  TextEditingController? website;
  TextEditingController? email;
  TextEditingController? facebook;

  TextEditingController? verticalline;
  TextEditingController? horizonalline;
  TextEditingController? reservationphone;
  TextEditingController? reservationemail;

  TextEditingController? salesphone;

  TextEditingController? salesemail;

  TextEditingController? accountingphonr;
  TextEditingController? accountingemail;

  Statusrequest statusrequest = Statusrequest.none;
  Statusrequest uploadfilesstatusrequest = Statusrequest.none;
  Statusrequest getimagesstatusrequest = Statusrequest.none;
  Statusrequest getfilessstatusrequest = Statusrequest.none;

  AddAccountData accountData = AddAccountData(Get.find());
  uploadfiles(List<File>? files) async {
    print('uploading files function');

    isloading.value = true;
    await Future.delayed(Duration(seconds: 5));
    for (int i = 0; i < files!.length; i++) {
      print(
          "-----------------------------------------------------------$i-------${files.length}---------------------------");
      var response =
          await accountData.uploadimagefiles(hotel!.id.toString(), photos![i]);
      if (response['status'] == 'success') {
        Get.snackbar(
            'Successfully', "uploadding image ${p.basename(files[i].path)}");
      } else {
        Get.snackbar(
            'Error', "Error uploadding image ${p.basename(files[i].path)}");
      }

      print(response);

      print("--------------------------for body ");
    }
    files.clear();
    print("--------------------------end upload ing image");
    isloading.value = false;

    Get.snackbar('Successfully', "Upload image successfully");
    gethotleimages(hotel!.id.toString());
  }

  uploadpdffiles(List<File>? files) async {
    print('uploading pdf files function');

    isloading.value = true;
    await Future.delayed(Duration(seconds: 5));
    for (int i = 0; i < files!.length; i++) {
      var response = await accountData.uploadpdffiles(
          hotel!.id.toString(), contract_attachement_files![i]);
      contract_attachement_files!.removeAt(i);
      print("--------------------------for body ");
    }

    print("--------------------------end upload ing image");
    isloading.value = false;
    Get.back();
    Get.snackbar('Successfully', "Upload files successfully");
    gethotlefiles(hotel!.id.toString());
  }

  deletefile(String fileid, String hotelid) async {
    print('Getting data');

    update();

    var response = await accountData.deletefile(hotelid, fileid);
    print(response);
    print("--------------------------------------here delete photo response");
    // print(response.body);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar("Successfully", "iamge Deleted successfully");
        Get.back();
        // photos!.removeAt(index);
        hotel!.contractAttachment!.removeWhere((element) {
          return element.id.toString() == fileid;
        });
        print(hotel!.photos!.length);
        // Get.back(canPop: false);
        update();

        // photos!.removeWhere((element) => element.i);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  deleteimage(String imageid, String hotelid) async {
    print('Getting data');

    update();

    var response = await accountData.deletephoto(hotelid, imageid);
    print(response);
    print("--------------------------------------here delete photo response");
    // print(response.body);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar("Successfully", "iamge Deleted successfully");

        hotel!.photos!.removeWhere((element) {
          return element.id.toString() == imageid;
        });
        print(hotel!.photos!.length);

        update();

        // photos!.removeWhere((element) => element.i);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  updatehoteldata(String hotelid) async {
    print('Getting data');
    statusrequest = Statusrequest.loading;

    update();
    await Future.delayed(Duration(seconds: 3));

    var data = hotel!.toJsonwithoutfiles();
    print(data);
    var response = await accountData.updatehotel(hotelid, data);
    print("--------------------------------------here update response");
    print(response);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        AddAccountController addcontroller = Get.find();
        HotelModel updated_hotel = HotelModel.fromJson(response['data']);
        addcontroller.hotels.forEach((element) {
          if (element.id == updated_hotel.id) {
            print(
                "----------------------------------replace model with another updated model");
            element = updated_hotel;
            Get.offAllNamed(AppRoutes.addaccount);
            Get.snackbar(
                "Successfully", "${updated_hotel.nameen} updated succssfully");
          }
        });
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  gethotlefiles(String hotelid) async {
    print(
        '-------------------------gettting hotel files after upload new file-----------------');
    getfilessstatusrequest = Statusrequest.loading;
    update();

    var response = await accountData.gethotlelfiles(hotelid);
    print("--------------------------------------here update response");
    print(response);

    getfilessstatusrequest = handlingdata(response);

    if (getfilessstatusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print(response);
        List data = response['data'];
        contract_attachement = null;
        hotel!.contractAttachment!
            .addAll(data.map((e) => ContractAttachment.fromJson(e)));
        update();

        print("get hotel images successfully");
      } else {
        getfilessstatusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  gethotleimages(String hotelid) async {
    print(
        '-------------------------gettting hotel image after upload images-----------------');
    getimagesstatusrequest = Statusrequest.loading;
    update();

    var response = await accountData.gethotleimages(hotelid);
    print("--------------------------------------here update response");
    print(response);

    getimagesstatusrequest = handlingdata(response);

    if (getimagesstatusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print(response);
        List data = response['data'];
        hotel!.photos!.clear();
        hotel!.photos!.addAll(data.map((e) => Photos.fromJson(e)));
        update();

        print("get hotel images successfully");
      } else {
        getimagesstatusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  departmentContactdetails_save_data_next_button() {
    hotel!.reservationPhone = reservationphone!.text;
    hotel!.reservationEmail = reservationemail!.text;

    hotel!.salesEmail = salesemail!.text;

    hotel!.salesPhone = salesphone!.text;
    hotel!.accountingEmail = accountingemail!.text;
    hotel!.accountingPhone = accountingphonr!.text;
    print(hotel!.toJson());
  }

  save_payment_data() {
    hotel!.password = activepayment.value;
    print(hotel!.toJson());
  }

  save_minimumcommision_data() {
    hotel!.b2b = int.parse(b2b!.text == "" ? '0' : b2b!.text.toString());
    hotel!.b2c = int.parse(b2c!.text == "" ? '0' : b2c!.text.toString());
    print(hotel!.toJson());
  }

  save_account_approval() {
    hotel!.userName = username!.text.toString();
    hotel!.password = password!.text.toString();
    print(hotel!.toJson());
  }

  save_availability_rate_provider_data() {
    hotel!.availabilityandrateprovider = availabilityandrateprovider.value;
  }

  addhotelAccoutnt_nextbutton_savedata() {
    hotel!.namear = name!.text;
    hotel!.nameen = name!.text;
    hotel!.country = country!.text;
    hotel!.city = city!.text;
    hotel!.phone = phone!.text;
    hotel!.hoteStars = hotelstars.toInt();

    hotel!.review = googlereview!.text;

    hotel!.website = website!.text;
    hotel!.email = email!.text;

    hotel!.facebook = facebook!.text;

    hotel!.lat =
        double.parse(verticalline!.text == "" ? '0' : verticalline!.text);
    hotel!.long =
        double.parse(horizonalline!.text == "" ? '0' : horizonalline!.text);
    print(hotel!.toJson());
  }

  @override
  void onInit() {
    name = TextEditingController();
    b2c = TextEditingController();
    b2b = TextEditingController();

    country = TextEditingController();

    city = TextEditingController();
    username = TextEditingController();

    password = TextEditingController();

    phone = TextEditingController();

    googlereview = TextEditingController();

    website = TextEditingController();

    email = TextEditingController();

    facebook = TextEditingController();
    verticalline = TextEditingController();
    horizonalline = TextEditingController();
    reservationphone = TextEditingController();
    reservationemail = TextEditingController();

    salesphone = TextEditingController();

    salesemail = TextEditingController();

    accountingphonr = TextEditingController();
    accountingemail = TextEditingController();

    hotel = Get.arguments['hotel'];
    print(hotel!.id.toString());
    if (hotel != null) {
      name!.text = hotel!.nameen ?? "";
      country!.text = hotel!.country ?? "";
      availabilityandrateprovider.value = hotel!.availabilityandrateprovider!;
      // activepayment.value=hotel!.pa;
      username!.text = hotel!.userName!;
      password!.text = hotel!.password!;

      city!.text = hotel!.city ?? "";
      phone!.text = hotel!.phone ?? "";
      googlereview!.text = hotel!.review ?? "";
      website!.text = hotel!.website ?? "";

      email!.text = hotel!.email ?? "";
      phone!.text = hotel!.phone ?? "";
      reservationemail!.text = hotel!.reservationEmail!;
      reservationphone!.text = hotel!.reservationPhone!;
      salesemail!.text = hotel!.salesEmail!;
      salesphone!.text = hotel!.salesPhone!;
      accountingemail!.text = hotel!.accountingEmail!;
      accountingphonr!.text = hotel!.accountingPhone!;

      facebook!.text = hotel!.facebook ?? "";
      verticalline!.text = hotel!.lat == null ? "" : hotel!.lat.toString();

      horizonalline!.text = hotel!.long == null ? "" : hotel!.long.toString();
      b2c!.text = hotel!.b2c == null ? "" : hotel!.b2c.toString();
      b2b!.text = hotel!.b2b == null ? "" : hotel!.b2b.toString();
    }

    // TODO: implement onInit
    super.onInit();
  }
}

import 'dart:io';

import 'package:super_admin/Apiapplink.dart';

import '../../../../core/class/crud.dart';

class AddAccountData {
  Crud crud;
  AddAccountData(this.crud);

  gethotles() async {
    var response = await crud.Sendrequest('GET', ApiApplinks.hotels);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  gethotleimages(String hotelid) async {
    var response = await crud.Sendrequest(
      'GET',
      ApiApplinks.hotels + '$hotelid/photos/',
    );

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  gethotlelfiles(String hotelid) async {
    var response = await crud.Sendrequest(
      'GET',
      ApiApplinks.hotels + '$hotelid/contract/',
    );

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deletehotle(String id) async {
    print(ApiApplinks.hotels + '${id}/');
    var response =
        await crud.Sendrequest('DELETE', ApiApplinks.hotels + '${id}/');

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  updatehotel(String id, Map<dynamic, dynamic> data) async {
    print(ApiApplinks.hotels + '${id}/');
    print("update hotel data is ----------------------_____>");
    print(data);
    var response =
        await crud.Sendrequest('PATCH', ApiApplinks.hotels + '${id}/', data);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deletephoto(String hotelid, String imageid) async {
    print(ApiApplinks.hotels + '${hotelid}/photos/$imageid/');
    var response = await crud.Sendrequest(
      'DELETE',
      ApiApplinks.hotels + '${hotelid}/photos/$imageid/',
    );

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deletefile(String hotelid, String fileid) async {
    print(ApiApplinks.hotels + '${hotelid}/contract/$fileid/');
    var response = await crud.Sendrequest(
      'DELETE',
      ApiApplinks.hotels + '${hotelid}/contract/$fileid/',
    );

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  uploadimagefiles(
    String id,
    File files,
  ) async {
    print(ApiApplinks.hotels + '${id}/photos');
    var response = await crud.Sendrequest(
        'POST',
        ApiApplinks.hotels + '${id}/photos/',
        {'phototype': "upload from android app"},
        files,
        'photo');

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  uploadpdffiles(
    String id,
    File files,
  ) async {
    var response = await crud.Sendrequest(
        'POST', ApiApplinks.hotels + '${id}/contract/', {}, files, 'file');

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  uploadexcelfiles(
    File files,
  ) async {
    var response = await crud.Sendrequest('PUT',
        "http://192.168.1.11:8000/booking/transformers/", {}, files, 'file');

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

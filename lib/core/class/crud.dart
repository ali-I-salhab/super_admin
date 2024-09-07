import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path/path.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:super_admin/core/class/statusrequest.dart';
import 'package:super_admin/core/services/services.dart';

import '../functions/checkinternetconnection.dart';

class Crud {
  Future<Either<Statusrequest, Map>> Sendrequest(String requesttype, String url,
      [Map? data, File? file, String? filerequestname]) async {
    MyServices serv = Get.find();
    String accesstoken = serv.shared.getString("accesstoken")!;
    print(JwtDecoder.isExpired(accesstoken));
    print(url);
    var uri = Uri.parse(url);
    var request = http.MultipartRequest(requesttype, uri);
    request.headers.addAll({
      'Authorization': 'JWT ' + serv.shared.getString("accesstoken").toString(),
      'type': "superadmin"
    });
    //
    try {
      if (await checkinternetstatus()) {
        print('checkinternetstatus is ${await checkinternetstatus()}');
        if (file != null &&
            (requesttype == "POST" ||
                requesttype == "PATCH" ||
                requesttype == "PUT")) {
          var length = await file.length();
          var stream = http.ByteStream(file.openRead());
          stream.cast();
          // print(basename(image.path));
          var multipartFile = http.MultipartFile(
              filerequestname!, stream, length,
              filename: basename(file.path));
          request.files.add(multipartFile);
        }
        if (requesttype == 'POST' ||
            requesttype == "PATCH" ||
            requesttype == "PUT") {
          data!.forEach((key, value) {
            print(key + value.toString());
            request.fields[key] = value.toString();
          });
        }
        print(request.fields);
        var myrequest = await request.send();

        print("------------------------------end send request ");

        var response = await http.Response.fromStream(myrequest);
        print(response.body);
        print(response.statusCode);

        if (response.statusCode == 204 && requesttype == 'DELETE') {
          return Right({"status": "success", "data": {}});
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);

          var responsebody = jsonDecode(response.body);

          return Right({
            "status": responsebody.length == 0 ? "failure" : "success",
            "data": responsebody
          });
        } else {
          print("--------------------------------serverfailure");
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        print("--------------------------------offline");

        return const Left(Statusrequest.offlinefailure);
      }
    } on SocketException catch (e) {
      print('server exception--------------------->$e');
      return Left(Statusrequest.serverexception);
    } on TimeoutException catch (e) {
      print('server exception--------------------->$e');

      return Left(Statusrequest.serverexception);
    } catch (e) {
      print('server exception--------------------->$e');

      return Left(Statusrequest.serverexception);
    }

    // http.StreamedResponse response = await request.send();
  }

  Future<Either<Statusrequest, Map>> updatedata(
      String url, File? file, Map data,
      [String? namerequest]) async {
    MyServices serv = Get.find();
    String accesstoken = serv.shared.getString("accesstoken")!;
    namerequest ??= "file";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("PUT", uri);
    request.headers.addAll({'Authorization': accesstoken});

    if (file != null) {
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      stream.cast();
      // print(basename(image.path));
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    // http.StreamedResponse response = await request.send();

    print(
        "-----------------response body for update with status code-----------------------");
    print('status code is ${response.statusCode}');
    print(response.body);
    print("----------------------------------------");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right({'status': 'success', 'data': responsebody});
    } else {
      return const Left(Statusrequest.serverfailure);
    }
  }

  Future<Either<Statusrequest, Map>> patchdata(String url, Map data,
      [String? namerequest, File? image]) async {
    MyServices serv = Get.find();
    String accesstoken = serv.shared.getString("accesstoken")!;
    print("update hotleeeeeeelll Data");
    if (namerequest == null) {
      namerequest = "file";
    }
    print("upddate passed data $data");

    var uri = Uri.parse(url);
    print(uri);
    var request = http.MultipartRequest("PATCH", uri);
    request.headers.addAll({'Authorization': accesstoken});

    if (image != null) {
      print("image != null");
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      // print(basename(image.path));
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      print(key);
      print(value);
      request.fields[key] = value.toString();
    });
    // add Data to request
    // Send Request
    try {
      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);

      // myrequest.stream.listen((value) {
      //   print(
      //       "value ------------------------$value------------------------------value");
      // }).onDone(() async {});

      // For get Response Body
      // http.StreamedResponse response = await request.send();

      print(
          "-----------------response body for update with status code-----------------------");
      print('status code is ${response.statusCode}');
      print(response.body);
      print("----------------------------------------");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        Map responsebody = jsonDecode(response.body);
        return Right({'status': 'success', 'data': responsebody});
      } else {
        return const Left(Statusrequest.serverfailure);
      }
    } catch (e) {
      print("FromCrud---------------> serverexception");
      print(e);
      return const Left(Statusrequest.serverexception);
    }
  }

  Future<Either<Statusrequest, Map>> getdata(String url,
      [Map<String, String> moreheaders = const {}]) async {
    MyServices serv = Get.find();
    String accesstoken = serv.shared.getString("accesstoken")!;
    try {
      if (await (checkinternetstatus())) {
        print("good internet connection the passed data is ");

        print("url : $url");
        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "JWT " + accesstoken
        };
        headers.addAll(moreheaders);
        print(headers);
        // internet connection
        // var response = await Dio().post(url, data: jsonEncode(data));
        var response = await http.get(Uri.parse(url), headers: headers);

        print("main response ----------> ${response.body}");
//
        if (response.statusCode == 200 || response.statusCode == 201) {
          List responsebody = json.decode(response.body);
          print('respose after decode');
          print(responsebody);
          Map a = {
            'status': responsebody.length == 0 ? 'failure' : 'success',
            'data': responsebody
          };

          return Right(a);
        } else {
          print("FromCrud---------------> serverfailure");
          //no response from server
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        print("FromCrud---------------> offlinefailure");
        //no internet connection
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print("FromCrud---------------> serverexception");
      print(e);
      return const Left(Statusrequest.serverexception);
    }
  }

  Future<Either<Statusrequest, Map>> deletedata(String url, [Map? data]) async {
    MyServices serv = Get.find();
    String accesstoken = serv.shared.getString("accesstoken")!;
    print('Delete hotel $data');

    try {
      if (await (checkinternetstatus())) {
        print("good interner ");
        var headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "JWT " + accesstoken
        };
        var request = http.Request('DELETE', Uri.parse(url));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();
        print(response.statusCode);
        if (response.statusCode == 204 || response.statusCode == 201) {
          //get response from server

          print(
              '-------response code 200 or 201---------success-----crud--- data passed to api-------$response');
          print(response);
          print(data);
          // Map responsebody = jsonDecode(await response.stream.bytesToString());

          return Right({'status': 'success'});
        } else {
          print("FromCrud---------------> serverfailure");
          //no response from server
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        print("FromCrud---------------> offlinefailure");
        //no internet connection
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print("FromCrud---------------> serverexception");
      print(e);
      return const Left(Statusrequest.serverexception);
    }
  }

// this method for only login
  Future<Either<Statusrequest, Map>> postdata(String url, Map data,
      [bool islogin = false]) async {
    MyServices serv = Get.find();
    // String accesstoken = !islogin ? serv.shared.getString("accesstoken")! : "";
    try {
      if (await (checkinternetstatus())) {
        print("good internet connection the passed data is ");
        print(data);
        print("url : $url");

        var response = await http.post(Uri.parse(url), body: data, headers: {
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': accesstoken
        });
        print(response.body);
        print(response.statusCode);
        if (response.statusCode.toString().startsWith('4')) {
          print("crud handle 400 eroors or client exciptions");
          Map<String, dynamic> res = jsonDecode(response.body);

          print(res);
          String detalvalue = "";

          res.forEach((key, value) {
            detalvalue += key.toString() +
                "  :  " +
                value.toString().replaceAll('[', " ").replaceAll(']', " ");
          });
          res.addAll({
            "status": "client_error",
            "statuscode": response.statusCode.toString(),
            "details": detalvalue
          });
          print(res);
          return Right(res);
        }
        if (response.statusCode == 204) {
          return Right(
              {"status": "success", "data": "password reset correctly"});
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(
              '-------response code 200 or 201---------success-----crud--- data passed to api-------$response');
          print(response.body);
          print(data);
          Map responsebody = jsonDecode(response.body);

          return Right({
            "status": responsebody.length == 0 ? "failure" : "success",
            "data": responsebody
          });
        } else {
          // here response code 500
          print("FromCrud---------------> serverfailure");

          return const Left(Statusrequest.serverexception);
        }
      } else {
        print("FromCrud---------------> offlinefailure");
        //no internet connection
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      if (e is SocketException) {
        return const Left(Statusrequest.serverexception);
      } else if (e is TimeoutException) {
        return const Left(Statusrequest.serverexception);
      } else if (e is http.ClientException) {
        if (e.uri != null) {
          print('Error for URL: ${e.uri}');
          return const Left(Statusrequest.serverexception);
        }
        print('HTTP Error: ${e.message}');
        return const Left(Statusrequest.serverexception);
      } else {
        print('General Exception: $e');
        return const Left(Statusrequest.serverexception);
      }
    }
  }

  Future<Either<Statusrequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    MyServices serv = Get.find();
    String accesstoken = serv.shared.getString("accesstoken")!;
    if (namerequest == null) {
      namerequest = "file";
    }
    // print("upload image with post reqeuest ${image!.path}");

    var uri = Uri.parse(url);
    // print(uri);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll({'Authorization': accesstoken});

    if (image != null) {
      print("image != null");
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      // print(basename(image.path));
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // myrequest.stream.listen((value) {
    //   print(
    //       "value ------------------------$value------------------------------value");
    // }).onDone(() async {});

    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    print("----------------------------------------");
    print(response.body);
    print("----------------------------------------");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(Statusrequest.serverfailure);
    }
  }
}

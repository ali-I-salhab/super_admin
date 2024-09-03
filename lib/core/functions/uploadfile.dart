import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

// open camera to upload image
imageuploadcamera() async {
  final ImagePicker _picker = ImagePicker();
  XFile? file = await _picker.pickImage(source: ImageSource.camera);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

Future<File?> filesuploadgalllery({bool issvg = false}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          issvg ? ['SVG', 'svg'] : ["jpg", "jpeg", 'png', 'Gif']);

  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  } else {
    return null;
  }
}

Future<File> cropImage(File _pickedFile, context) async {
  print("crop image function");
  if (_pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: _pickedFile!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    if (croppedFile != null) {
      print("crooooooooooooooooooooped image is $croppedFile");
      return File(croppedFile.path);
    }
  }
  return _pickedFile;
}

// open gallery yo upload image
// here upload multiple images
Future<List<File>?> fileuploadgalllery({bool issvg = false}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions:
          issvg ? ['SVG', 'svg'] : ["jpg", "jpeg", 'png', 'Gif']);

  if (result != null) {
    List<File> files = result.paths.map((path) => File(path!)).toList();
    return files;
  } else {
    return null;
  }
}

// here we will add fun to upload docs
Future<File> getimagefrom_url_as_file({required String url}) async {
  /// Get Image from server
  final Response res = await Dio().get<List<int>>(
    url,
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  /// Get App local storage
  final Directory appDir = await getApplicationDocumentsDirectory();

  /// Generate Image Name
  final String imageName = url.split('/').last;

  /// Create Empty File in app dir & fill with new image
  final File file = File(join(appDir.path, imageName));

  file.writeAsBytesSync(res.data as List<int>);

  return file;
}

Future<File?> uploadexcelfile() async {
  File file = File('path');
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    file = File(result.files.single.path!);
    return file;
  } else {
    return null;
    // User canceled the picker
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitpp() {
  Get.defaultDialog(
      content: Text(""),
      title: 'هل تريد الخروج من التطبيق ؟',
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text('نعم')),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('الغاء'))
      ]);
  return Future.value(true);
}

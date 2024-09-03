import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/functions/animatedloadingbutton.dart';
import 'package:super_admin/core/functions/uploadfile.dart';

Future<File?> showimagedialogue(
  BuildContext context,
  String imageurl,
  void Function()? onedit, {
  File? imagefiletoview,
  void Function()? ondelete,
}) async {
  File? croppedimage;
  bool isloading = false;

  await showDialog(
      context: context,
      builder: (w) {
        return StatefulBuilder(
          builder: (context, setstate) {
            print("rebuillllllllllllllding dialogue with statefullbuilder");
            return UnconstrainedBox(
              child: Hero(
                tag: "df",
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.sp)),
                  padding: EdgeInsets.all(10),
                  height: 70.h,
                  width: 70.w,
                  child: Material(
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            width: 70.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.sp),
                              child: croppedimage == null
                                  ? imageurl == ''
                                      ? Image.file(imagefiletoview!)
                                      : CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              UnconstrainedBox(
                                                child: Container(
                                                  width: 3.h,
                                                  height: 3.h,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ),
                                          imageUrl: imageurl)
                                  : Image.file(croppedimage!),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.all(10.sp),
                          padding: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("delete");
                                  if (ondelete != null) {
                                    ondelete!();
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(2.sp),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              AnimatedLoadingButton(
                                croppedimage == null ? 'edit' : "save",
                                croppedimage == null
                                    ? () async {
                                        File image;
                                        setstate(() {
                                          isloading = true;
                                        });
                                        imageurl == ""
                                            ? image = imagefiletoview!
                                            : image =
                                                await getimagefrom_url_as_file(
                                                    url: imageurl);
                                        croppedimage =
                                            await cropImage(image, context);

                                        setstate(() {
                                          isloading = false;
                                          print(
                                              "setstate 22222222222222222222");
                                        });
                                      }
                                    : () {
                                        print("cropped nto null");
                                        // Get.back();
                                        if (onedit != null) {
                                          onedit!();
                                        } else {
                                          print("null on edit function");
                                        }
                                        ;
                                        // return await File(croppedimage!.path);
                                      },
                                isLoading: isloading,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      });
  return croppedimage == null ? null : await File(croppedimage!.path);
}

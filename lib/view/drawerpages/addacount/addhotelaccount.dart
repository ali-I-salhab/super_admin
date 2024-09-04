import 'dart:io';
import 'dart:math';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/Apiapplink.dart';
import 'package:super_admin/controller/addacount/addaccontcontroller.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';
import 'package:super_admin/core/constants/apptextstyle.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/core/functions/imagedilogue.dart';
import 'package:super_admin/core/functions/uploadfile.dart';
import 'package:super_admin/core/functions/validinput.dart';
import 'package:super_admin/map.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/auth/widgets/customSwitchslider.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customHotelfromfield.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customNextbutton.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customStepper.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:super_admin/view/drawerpages/amenties/functions/dialogus.dart';
import 'package:super_admin/view/drawerpages/amenties/mainamenties.dart';
import 'package:super_admin/view/widgets/auth/authtextformfield.dart';

class AddHotelAccount extends StatelessWidget {
  const AddHotelAccount({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.put(AddHotelAccountController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(title: 'Add Hotel Account', isactioned: false),
      body: Form(
        key: controller.formstate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.sp,
                ),
                SlideSwitcher(
                  first: 'Manually',
                  second: 'Requested',
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CutomStepper(
                    steps: 1,
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.name,
                  title: 'Hotel name',
                  hint: 'Hotel name',
                ),
                Container(
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: 40.w,
                        child: CustomTextformfieldAddAccount(
                          readonly: true,
                          mycontroller: controller.country,
                          title: 'Hotel Country',
                          hint: 'Hotel Country',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Clicable(
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
                              margin: EdgeInsets.symmetric(horizontal: 12.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.main,
                                  borderRadius: BorderRadius.circular(12.sp)),
                              child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Icon(Icons.arrow_back_ios)),
                            ),
                            ontap: () {
                              showDialog(
                                context: context,
                                useRootNavigator: false,
                                builder: (context) => StatefulBuilder(
                                  builder: (ctx, setState) =>
                                      CountryPickerDialog(
                                    languageCode: "EN",
                                    style: null,
                                    filteredCountries: countries,
                                    searchText: "serach",
                                    countryList: countries!,
                                    selectedCountry: countries[0],
                                    onCountryChanged: (Country country) {
                                      controller!.country!.text = country.name;
                                    },
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [Text("Hotel Rating")],
                ),
                AnimatedRatingStars(
                  initialRating: 2.5,
                  onChanged: (rating) {
                    controller.hotelstars = rating;
                  },
                  displayRatingValue: true, // Display the rating value
                  interactiveTooltips: true, // Allow toggling half-star state
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                  starSize: 40.0,
                  animationDuration: const Duration(milliseconds: 500),
                  animationCurve: Curves.easeInOut,
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.city,
                  title: 'Hotel City',
                  hint: 'Hotel City',
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.phone,
                  title: 'Phone number',
                  hint: 'Phone number',
                  isphone: true,
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.googlereview,
                  title: 'Google Review Nuber',
                  hint: 'Googlr review number',
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.website,
                  title: 'WebSite',
                  hint: 'Website',
                ),
                CustomTextformfieldAddAccount(
                  valid: (val) {
                    return validate(val!, 5, 19, "email");
                  },
                  mycontroller: controller.email,
                  title: 'Email',
                  hint: 'Email',
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.facebook,
                  title: 'Facebook Account',
                  hint: 'Facebook Account',
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.verticalline,
                  title: 'Vertical Line',
                  hint: 'vertical line',
                ),
                CustomTextformfieldAddAccount(
                  mycontroller: controller.horizonalline,
                  title: 'Horizontal Line',
                  hint: 'Horizontal line',
                ),
                Container(
                  height: 40.h,
                  width: double.infinity,
                  child: MapSample(
                      position: Position(
                          longitude: controller.hotel?.long ?? 0,
                          latitude: controller.hotel?.lat ?? 0,
                          timestamp: DateTime.now(),
                          altitude: 0,
                          accuracy: 0,
                          altitudeAccuracy: 0,
                          headingAccuracy: 0,
                          heading: 0,
                          speed: 0,
                          speedAccuracy: 0)),
                ),
                Row(
                  children: [
                    Text(
                      ' Images',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2.sp,
                  color: AppColors.main,
                ),
                GetBuilder<AddHotelAccountController>(builder: (controller) {
                  return controller.photos!.length != 0
                      ? Text(
                          ' images to upload',
                          textAlign: TextAlign.start,
                        )
                      : Text(
                          'No Selected images to upload',
                          textAlign: TextAlign.start,
                          style: AppTextStyle.greysmall,
                        );
                }),
                SizedBox(
                  height: 5.sp,
                ),
                GetBuilder<AddHotelAccountController>(builder: (controller) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            controller.photos!.length,
                            (index) => controller.photos!.length != 0
                                ? Clicable(
                                    ontap: () async {
                                      int editable_index = index;
                                      bool isdelete = false;
                                      print("tabed image index is $index");
                                      print(controller.photos?[index]);
                                      File? croppedimage =
                                          await showimagedialogue(
                                              context,
                                              '',
                                              () {
                                                Get.back();
                                              },
                                              imagefiletoview:
                                                  controller.photos?[index],
                                              ondelete: () {
                                                controller.photos!
                                                    .removeAt(index);
                                                print(
                                                    "--------------------------removed successfully");

                                                print(index);
                                                controller.photos
                                                    ?.forEach((element) {
                                                  print(element);
                                                });
                                                isdelete = true;
                                                Get.back();
                                                controller.update();
                                              });
                                      print(
                                          "-------------->>>>>>cropped image iss");
                                      print(croppedimage);
                                      print(isdelete);
                                      print(index);
                                      if (!isdelete) {
                                        controller.photos?[index] =
                                            croppedimage ??
                                                controller.photos![index];
                                        controller.update();
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        child: Image.file(
                                          controller.photos![index],
                                          height: 20.h,
                                          width: 20.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : Text("no photo selected"))
                      ],
                    ),
                  );
                }),
                Divider(
                  thickness: 2.sp,
                  color: AppColors.main,
                ),
                GetBuilder<AddHotelAccountController>(builder: (c) {
                  return controller.hotel?.photos?.length != 0
                      ? Row(
                          children: [
                            Text(
                              'Hotel Images',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )
                      : Text(
                          "Hotel without any uploaded image",
                          style: AppTextStyle.greysmall,
                        );
                }),
                SizedBox(
                  height: 5.sp,
                ),
                Container(
                  width: 90.w,
                  // color: Colors.red,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        // color: Colors.blue,
                        child: GetBuilder<AddHotelAccountController>(
                            builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            controller.hotel?.photos != null
                                ? controller.hotel!.photos!.length
                                : 0,
                            (index) => Clicable(
                              ontap: () {
                                showdeletedialogue(() async {
                                  await controller.deleteimage(
                                      controller.hotel!.photos![index].id
                                          .toString(),
                                      controller.hotel!.id.toString());
                                  Navigator.of(Get.overlayContext!,
                                          rootNavigator: true)
                                      .pop();
                                }, 'Delete This image');
                              },
                              child: Container(
                                // color: Colors.red,
                                margin: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    // child: Image.network(
                                    // "http://www.pythonanywhere.com/user/ali33salhab/files/home/ali33salhab/deployingbookingapp/media/hotel/photos/Screenshot_20240903-055614_Facebook.png"),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://www.pythonanywhere.com/user/ali33salhab/files/home/ali33salhab/deployingbookingapp/media/hotel/photos/Screenshot_20240903-055614_Facebook.png",
                                      // imageUrl: ApiApplinks.hotelimages +
                                      //     controller
                                      //         .hotel!.photos![index].photo!,
                                      imageBuilder: (context, imageProvider) {
                                        // Call your widget or use native ui
                                        return Container(
                                          height: height,
                                          width: width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      placeholderFadeInDuration: Duration(
                                          microseconds:
                                              10), // The duration of the fade-in animation for the [placeholder]
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) {
                                        // use any loader or use native ui
                                        return CircularProgressIndicator
                                            .adaptive(
                                          backgroundColor: Colors.red,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.red),
                                        );
                                      },

                                      errorWidget: (context, url, error) {
                                        // Call your error widget or use native ui
                                        return Center(child: Icon(Icons.image));
                                      },
                                      fadeInDuration:
                                          Duration(milliseconds: 10),
                                      fadeOutDuration:
                                          Duration(milliseconds: 10),
                                      fit: BoxFit.fill,
                                      height: height,
                                      width: height,
                                      // // useOldImageOnUrlChange: true,
                                      // memCacheWidth: cacheWidth.round(),
                                      // memCacheHeight: cacheHeight.round(),
                                    )

                                    // imageUrl: ApiApplinks.hotelimages +
                                    //     controller
                                    //         .hotel!.photos![index].photo!),
                                    ),
                              ),
                            ),
                          )
                        ],
                      );
                    })),
                  ),
                ),
                Clicable(
                  ontap: () async {
                    List<File>? photos = await fileuploadgalllery();
                    controller.photos!.addAll(photos ?? []);
                    controller.update();
                    print(controller.photos);
                  },
                  child: Container(
                    height: 10.h,
                    width: 80.w,
                    margin: EdgeInsets.only(top: 10.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.black26,
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Iconify(AppIcons.Upload),
                        Text(
                          'upload files',
                          style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                        )
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Text(
                  'Only jpg/png files can be uploaded and no more than 500kb',
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomNextButton(
                  ontap: () {
                    controller.isloading = false.obs;

                    if (controller.photos!.isNotEmpty) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (w) {
                            return StatefulBuilder(
                                builder: (context, setstate) {
                              return UnconstrainedBox(
                                child: Material(
                                  child: Container(
                                    height: 20.h,
                                    width: 80.w,
                                    child: Obx(() => !controller.isloading.value
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("save uploading photos"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Clicable(
                                                      child: Text("cancel"),
                                                      ontap: () {
                                                        Get.back();
                                                      }),
                                                  Clicable(
                                                      child: Text("discard"),
                                                      ontap: () {
                                                        Get.back();
                                                      }),
                                                  Clicable(
                                                      child: Text("save"),
                                                      ontap: () async {
                                                        controller.isloading
                                                            .value = true;

                                                        await controller
                                                            .uploadfiles(
                                                                controller
                                                                    .photos);
                                                        Navigator.of(
                                                                Get
                                                                    .overlayContext!,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                      })
                                                ],
                                              )
                                            ],
                                          )
                                        : Clicable(
                                            ontap: () {
                                              controller.isloading.value = true;
                                            },
                                            child: UnconstrainedBox(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                    "Uploading images......  "),
                                                CircularProgressIndicator(
                                                  color: AppColors.main,
                                                ),
                                              ],
                                            )))),
                                  ),
                                ),
                              );
                            });
                          });

                      print("-----------------------not empty");
                      // Get.dialog(
                      //     Obx(
                      //       () => !controller.isloading.value
                      //           ? AlertDialog(
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(2.w)),
                      //               title: Text(
                      //                 'Alert !!',
                      //               ),
                      //               content: const Text('save uploaded images'),
                      //               actionsAlignment: MainAxisAlignment.center,
                      //               actions: [
                      //                 TextButton(
                      //                   child: const Text("discard"),
                      //                   onPressed: () => Get.back(),
                      //                 ),
                      //                 TextButton(
                      //                   child: const Text("save"),
                      //                   onPressed: () {
                      //                     controller.uploadfiles();
                      //                   },
                      //                 ),
                      //               ],
                      //             )
                      //           : Container(
                      //               height: 10.h,
                      //               width: 10.w,
                      //               child: CircularProgressIndicator()),
                      //     ),
                      //     transitionDuration: Duration(seconds: 1),
                      //     barrierColor: AppColors.main.withOpacity(0.5),
                      //     barrierDismissible: false);

                      // Get.dialog(Container(
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         "save Uploaded images ?",
                      //       ),
                      //       Row(
                      //         children: [
                      //           Clicable(child: Text("save"), ontap: () {}),
                      //           Clicable(child: Text("cancel"), ontap: () {})
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ));
                      // ScaffoldMessenger.of(context).showMaterialBanner(
                      //     MaterialBanner(
                      //         backgroundColor: AppColors.main,
                      //         content: Text("Save uploadded images "),
                      //         actions: [
                      //       Clicable(
                      //           child: Text("save"),
                      //           ontap: () {
                      //             ScaffoldMessenger.of(context)
                      //                 .removeCurrentMaterialBanner();
                      //           })
                      //     ]));
                    } else {
                      if (controller.formstate.currentState!.validate()) {
                        controller.addhotelAccoutnt_nextbutton_savedata();
                        Get.toNamed(AppRoutes.departmentcontactdetials);
                      } else {
                        Get.snackbar("Error",
                            controller.formstate.currentState!.toString());
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:intl_phone_field/countries.dart';

import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/addacount/addaccontcontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:super_admin/core/constants/imageassets.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/clicable.dart';
import 'package:super_admin/core/functions/uploadfile.dart';
import 'package:super_admin/view/appIcons.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/addedHotelcard.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_clips.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:super_admin/view/drawerpages/amenties/functions/dialogus.dart';
import 'package:url_launcher/url_launcher.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    AddAccountController controller = Get.put(AddAccountController());
    return Scaffold(
      extendBody: true, // <--- do not forget mark this as true
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.only(bottom: 12.sp),
          width: 50.w,
          height: 7.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.sp),
              color: AppColors.main),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Clicable(
                ontap: () {
                  showDialog(
                    context: context,
                    useRootNavigator: false,
                    builder: (context) => StatefulBuilder(
                      builder: (ctx, setState) => CountryPickerDialog(
                        languageCode: "EN",
                        style: null,
                        filteredCountries: countries,
                        searchText: "serach",
                        countryList: countries!,
                        selectedCountry: countries[0],
                        onCountryChanged: (Country country) async {
                          // controller!.country!.text = country.name;
                          // print(country.code);

<<<<<<< Updated upstream
                          // states.forEach((element) {
                          //   print(element.name);
                          // });
                          controller.countreyfilter.value = country.name;
                          controller.states = await getStatesOfCountry(
                              country.code); // Afghanistan
                        },
=======
                        onCountryChanged: (List<Country> country) async {
                          controller.countreyfilter.addAll([]);

                          // controller.states = await getStatesOfCountry(
                          //     country.code);
                        },
                        selectedCountry: [],
>>>>>>> Stashed changes
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Iconify(AppIcons.equaltor),
<<<<<<< Updated upstream
                    Container(
                      width: 15.w,
                      child: Text(
                        ' Country',
                        style: TextStyle(color: Colors.white),
=======
                    Obx(
                      () => UnconstrainedBox(
                        child: Container(
                          width: 15.w,
                          height: 40.sp,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              children: [
                                ...controller.countreyfilter
                                    .map((element) => Text(
                                          element.name,
                                          style: TextStyle(color: Colors.white),
                                        ))
                                    .toList(),
                              ],
                              // style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
>>>>>>> Stashed changes
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: 3.sp,
                height: 7.h,
                alignment: Alignment.center,
              ),
              Clicable(
                ontap: () {
                  Get.defaultDialog(
                      title: "Select City",
                      content: Container(
                        height: 50.h,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                  controller.states != null
                                      ? controller.states!.length
                                      : 0,
                                  (index) => Clicable(
                                        ontap: () {
                                          controller.cityfilter.value =
                                              controller.states![index].name;
                                          Get.back();
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.all(2.sp),
                                            child: Text(
                                              controller.states![index].name,
                                              style: TextStyle(
                                                  color: AppColors.main),
                                            ),
                                          ),
                                        ),
                                      ))
                            ],
                          ),
                        ),
                      ));
                },
                child: Row(
                  children: [
                    Iconify(AppIcons.equaltor),
                    Container(
                      width: 15.w,
                      child: Text(
                        ' City',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(
          title: "Add Account",
          ontapaction: () {
            showMenu(
                context: context,
                position: RelativeRect.fromLTRB(129, 10.h, 12, 12),
                items: [
                  PopupMenuItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.addhotelaccount);
                    },
                    child: Row(
                      children: [Icon(Icons.add), Text('New Account ')],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () async {
                      controller.uplodedexcelfile = await uploadexcelfile();
                      if (controller.uplodedexcelfile != null) {
                        print(controller.uplodedexcelfile!.path);
                        print(p.extension(controller.uplodedexcelfile!.path));
                        if (p.extension(controller.uplodedexcelfile!.path) !=
                            ".xlsx") {
                          Get.snackbar('Error', 'File is not excel type',
                              backgroundColor: Colors.red.withOpacity(0.1),
                              snackPosition: SnackPosition.TOP);
                        } else {
                          await controller.uploadexcelfiles();
                        }
                      } else {
                        Get.snackbar('Error', 'No file selected',
                            backgroundColor: Colors.red.withOpacity(0.1),
                            snackPosition: SnackPosition.TOP);
                      }
                    },
                    child: Row(
                      children: [Icon(Icons.add), Text('Upload excel file')],
                    ),
                  ),
                  // PopupMenuItem(child: Text('ali'))
                ]);
          }),
      body: RefreshIndicator(
        onRefresh: () async {
          if (controller.hotels.isNotEmpty) {
            Get.snackbar("Warning", "Hotel list updated");
          } else {
            await controller.viewhotels();
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideSwitcher(
                  first: 'Manual',
                  second: 'Requested',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomClips(
                      name: 'Hotels',
                      iconasString: AppIcons.hotel,
                    ),
                    CustomClips(
                      name: 'Activity',
                      iconasString: AppIcons.Activity,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => Container(
                  padding: EdgeInsets.all(4.sp),
                  margin: EdgeInsets.symmetric(horizontal: 4.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.main),
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        "filtered by :",
                        style: AppTextStyle.main,
                      )),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2.sp),
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.main),
                              borderRadius: BorderRadius.circular(4.sp)),
                          child: Text(
                            controller.countreyfilter.value,
                            style: AppTextStyle.main,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 2.sp),
                          padding: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.main),
                              borderRadius: BorderRadius.circular(4.sp)),
                          child: Text(
                            controller.cityfilter.value + '',
                            style: AppTextStyle.main,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              // height: 65.h,
              // padding: EdgeInsets.symmetric(horizontal: 4.sp),
              // margin: EdgeInsets.symmetric(vertical: 12.sp),
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:
                      GetBuilder<AddAccountController>(builder: (controller) {
                    return Handlingdataview(
                        statusrequest: controller.statusrequest,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                              controller.hotels.length,
                              (index) => Clicable(
                                ontap: () {
                                  Get.toNamed(AppRoutes.addhotelaccount,
                                      arguments: {
                                        "hotel": controller.hotels[index]
                                      });
                                },
                                child: AddedHotelCard(
                                  oncall: () async {
                                    String phone = controller
                                        .hotels[index].phone
                                        .toString();
                                    if (phone == "") {
                                      Get.snackbar("Warning",
                                          "phone number not available");
                                    } else {
                                      await launchUrl(Uri.parse('tel:$phone'));
                                    }
                                  },
                                  oncancel: () {
                                    showdeletedialogue(() {
                                      controller.deletehotel(controller
                                          .hotels[index].id!
                                          .toString());
                                    }, "Delete Hotel Data");
                                  },
                                  image: ImageAssets.profile,
                                  name: controller.hotels[index].nameen!,
                                  location:
                                      controller.hotels[index].location ?? "",
                                ),
                              ),
                            )
                          ],
                        ));
                  })),
            )
          ],
        ),
      ),
    );
  }
}

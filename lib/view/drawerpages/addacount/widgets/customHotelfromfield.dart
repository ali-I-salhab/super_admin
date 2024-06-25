import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomTextformfieldAddAccount extends StatelessWidget {
  final String title;
  final String hint;
  final bool islabel;
  final int maxlines;

  // final TextEditingController? mycontroller;
  void Function()? ontap;
  final bool isphone;
  final String? Function(String?)? valid;

  CustomTextformfieldAddAccount(
      {super.key,
      required this.title,
      this.islabel = true,
      // required this.mycontroller,
      this.valid,
      required this.hint,
      this.isphone = false,
      this.maxlines = 1});

  @override
  Widget build(BuildContext context) {
    return !isphone
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              islabel
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: Text(
                          "$title",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: maxlines,
                  validator: valid,
                  // controller: mycontroller,
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    print("complete editing");
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.greytextformfield,
                      hintText: "$hint",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(19))),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Text(
                    "$title",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              IntlPhoneField(
                // controller: mycontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.greytextformfield,
                  // labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(19)),
                ),
                initialCountryCode: 'SY',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ],
          );
  }
}

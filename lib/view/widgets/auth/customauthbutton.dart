import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/colors.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomAuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: AppColors.primarycolor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

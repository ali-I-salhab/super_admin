import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.homelogo,
      height: 20.h,
    );
  }
}

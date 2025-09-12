import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle Regular_W400_10(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 10),
        fontWeight: FontWeight.w400,
      );
}

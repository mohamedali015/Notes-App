import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle Regular_W400_14(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 14),
        fontWeight: FontWeight.w400,
      );

  static TextStyle Medium_W500_16(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 16),
        fontWeight: FontWeight.w500,
      );

  static TextStyle SemiBold_W600_24(BuildContext context) => TextStyle(
        fontSize: MyResponsive.fontSize(context, value: 24),
        fontWeight: FontWeight.w600,
      );
}

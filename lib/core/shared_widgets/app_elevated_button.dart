import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';
import '../utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final VoidCallback? onPressed;

  const AppElevatedButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? AppColors.primary),
        padding: WidgetStateProperty.all(
          MyResponsive.paddingSymmetric(context, horizontal: 0, vertical: 15),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(
            buttonWidth ?? double.infinity,
            buttonHeight ?? MyResponsive.height(context, value: 55),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}

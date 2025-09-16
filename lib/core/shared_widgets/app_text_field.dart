import 'package:flutter/material.dart';
import 'package:notes/core/shared_widgets/app_validator.dart';

import '../helper/my_responsive.dart';
import '../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
  });

  final String hint;
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: AppValidator.field,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.multiline,
      cursorColor: AppColors.primary,
      maxLines: maxLines,
      decoration: _inputDecoration(context, hint: hint),
    );
  }

  ///////////////////////--Decorations//////////////////////
  InputDecoration _inputDecoration(
    BuildContext context, {
    String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(
        vertical: MyResponsive.height(context, value: 20),
        horizontal: MyResponsive.width(context, value: 10),
      ),
      border: _border(context, AppColors.primary),
      focusedErrorBorder: _border(context, AppColors.red),
      focusedBorder: _border(context, AppColors.primary),
      enabledBorder: _border(context, AppColors.white),
      errorBorder: _border(context, AppColors.red),
    );
  }

  InputBorder _border(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(MyResponsive.width(context, value: 8)),
      ),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}

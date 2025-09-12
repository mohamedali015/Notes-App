import 'package:flutter/material.dart';
import 'package:notes/core/shared_widgets/app_validator.dart';

import '../helper/my_responsive.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.type,
    required this.controller,
  });

  final TextFieldType type;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TextFieldType.title:
        return _titleField(
          context,
          AppValidator.field,
        );
      case TextFieldType.subTitle:
        return _subTitleField(context, AppValidator.field);
    }
  }

  ///////////////////////--Decorations//////////////////////
  InputDecoration _inputDecoration(
    BuildContext context, {
    String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      // hintStyle:
      // AppTextStyles.Medium_W500_12(context, color: AppColors.darkGray),
      // errorStyle: AppTextStyles.Medium_W500_12(context, color: AppColors.red),

      contentPadding: EdgeInsets.symmetric(
        vertical: MyResponsive.height(context, value: 20),
        horizontal: MyResponsive.width(context, value: 10),
      ),
      border: _border(context, AppColors.primary),
      focusedErrorBorder: _border(context, AppColors.red),
      focusedBorder: _border(context, AppColors.primary),
      enabledBorder: _border(context, AppColors.primary),
      errorBorder: _border(context, AppColors.red),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    return AppTextStyles.Regular_W400_14(context);
  }

  InputBorder _border(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(MyResponsive.width(context, value: 10)),
      ),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  /////////////////////////--TextFields////////////////////////////////
  Widget _titleField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: _textStyle(context),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
      ),
    );
  }

  Widget _subTitleField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: _textStyle(context),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
      ),
    );
  }
}

enum TextFieldType { title, subTitle }

import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';

import 'custom_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.notes,
          style: AppTextStyles.SemiBold_W600_24(context),
        ),
        const Spacer(),
        CustomIcon(
          icon: Icons.search,
        )
      ],
    );
  }
}

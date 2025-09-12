import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'custom_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.notes,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const Spacer(),
        CustomIcon(
          icon: Icons.search,
        )
      ],
    );
  }
}

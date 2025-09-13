import 'package:flutter/material.dart';
import '../helper/my_responsive.dart';
import 'custom_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});

  final String title;

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: MyResponsive.fontSize(context, value: 28),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const Spacer(),
        CustomIcon(
          onTap: onPressed,
          icon: icon,
        )
      ],
    );
  }
}

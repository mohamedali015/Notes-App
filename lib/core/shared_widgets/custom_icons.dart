import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap});

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MyResponsive.width(context, value: 45),
        height: MyResponsive.height(context, value: 45),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(25),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          size: MyResponsive.width(context, value: 26),
        ),
      ),
    );
  }
}

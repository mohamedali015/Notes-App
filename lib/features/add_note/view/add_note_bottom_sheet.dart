import 'package:flutter/material.dart';
import 'package:notes/core/helper/my_responsive.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          MyResponsive.paddingSymmetric(context, horizontal: 16, vertical: 10),
      child: Column(
        children: [],
      ),
    );
  }
}

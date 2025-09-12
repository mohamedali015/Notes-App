import 'package:flutter/material.dart';
import 'package:notes/core/shared_widgets/custom_app_bar.dart';
import 'package:notes/core/utils/app_strings.dart';

import '../../../../core/helper/my_responsive.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyResponsive.paddingSymmetric(context, horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: MyResponsive.height(context, value: 55),
            ),
            CustomAppBar(
              title: AppStrings.editNote,
              icon: Icons.check,
            ),
          ],
        ),
      ),
    );
  }
}

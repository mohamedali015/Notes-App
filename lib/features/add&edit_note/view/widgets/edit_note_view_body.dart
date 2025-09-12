import 'package:flutter/material.dart';
import 'package:notes/core/shared_widgets/app_text_field.dart';
import 'package:notes/core/shared_widgets/custom_app_bar.dart';
import 'package:notes/core/utils/app_strings.dart';

import '../../../../core/helper/my_responsive.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController contentController =
      TextEditingController();

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

            SizedBox(
              height: MyResponsive.height(context, value: 32),
            ),

            // Add your form fields or other widgets here for editing the note
            AppTextField(controller: titleController, hint: AppStrings.title),
            SizedBox(height: MyResponsive.height(context, value: 16)),
            AppTextField(
              controller: contentController,
              hint: AppStrings.content,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

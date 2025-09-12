import 'package:flutter/material.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/shared_widgets/app_text_field.dart';

import '../../../core/utils/app_strings.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController contentController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          MyResponsive.paddingSymmetric(context, horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text(
            AppStrings.addNote,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: MyResponsive.height(context, value: 24)),
          AppTextField(
            hint: AppStrings.title,
            controller: titleController,
          ),
          SizedBox(height: MyResponsive.height(context, value: 16)),
          AppTextField(
            hint: AppStrings.content,
            controller: contentController,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/shared_widgets/app_elevated_button.dart';
import 'package:notes/core/shared_widgets/app_text_field.dart';
import 'package:notes/features/add&edit_note/manager/add_note_cubit/add_note_cubit.dart';

import '../../../core/utils/app_strings.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNoteCubit>(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: MyResponsive.paddingSymmetric(context,
            horizontal: 16, vertical: 10),
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddNoteCubit addNoteCubit = AddNoteCubit.get(context);
    return Form(
      key: addNoteCubit.formKey,
      autovalidateMode: addNoteCubit.autoValidateMode,
      child: Column(
        children: [
          Text(
            AppStrings.addNote,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: MyResponsive.height(context, value: 24)),
          AppTextField(
            hint: AppStrings.title,
            controller: addNoteCubit.titleController,
          ),
          SizedBox(height: MyResponsive.height(context, value: 16)),
          AppTextField(
            hint: AppStrings.content,
            controller: addNoteCubit.contentController,
            maxLines: 5,
          ),
          SizedBox(height: MyResponsive.height(context, value: 28)),
          AppElevatedButton(
            buttonText: AppStrings.addNote,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

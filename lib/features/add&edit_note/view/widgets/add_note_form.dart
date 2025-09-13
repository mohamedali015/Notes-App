import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/shared_widgets/app_elevated_button.dart';
import 'package:notes/core/shared_widgets/app_text_field.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/features/add&edit_note/manager/add_note_cubit/add_note_cubit.dart';

import '../../../../core/utils/app_strings.dart';
import '../../manager/add_note_cubit/add_note_state.dart';

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
          const ColorListView(),
          SizedBox(height: MyResponsive.height(context, value: 28)),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => AppElevatedButton(
              isLoading: state is AddNoteLoading ? true : false,
              buttonText: AppStrings.addNote,
              onPressed: addNoteCubit.onPressedAddTask,
            ),
          ),
          SizedBox(height: MyResponsive.height(context, value: 24)),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: MyResponsive.width(context, value: 30),
            backgroundColor: AppColors.white,
            child: CircleAvatar(
              radius: MyResponsive.width(context, value: 25),
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: MyResponsive.width(context, value: 30),
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyResponsive.height(context, value: 70),
      child: ListView.builder(
        itemCount: AppColors.itemColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: MyResponsive.paddingSymmetric(context, horizontal: 4),
          child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
            AddNoteCubit addNoteCubit = AddNoteCubit.get(context);
            return GestureDetector(
              onTap: () => addNoteCubit.colorPicker(index),
              child: ColorItem(
                color: AppColors.itemColors[index],
                isSelected: addNoteCubit.currentIndex == index,
              ),
            );
          }),
        ),
      ),
    );
  }
}

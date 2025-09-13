import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/shared_widgets/app_text_field.dart';
import 'package:notes/core/shared_widgets/custom_app_bar.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/features/home/data/model/note_model.dart';
import 'package:notes/features/home/manager/notes_cubit/notes_cubit.dart';

import '../../../../core/helper/my_responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../manager/edit_note_cubit/edit_note_cubit.dart';
import '../../manager/edit_note_cubit/edit_note_state.dart';
import 'add_note_form.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MyResponsive.paddingSymmetric(context, horizontal: 24),
        child: BlocConsumer<EditNoteCubit, EditNoteState>(
            listener: (context, state) {
          if (state is EditNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          // EditNoteCubit.get(context).loadNote(noteModel);
          var cubit = EditNoteCubit.get(context);
          return Column(
            children: [
              SizedBox(
                height: MyResponsive.height(context, value: 55),
              ),
              CustomAppBar(
                title: AppStrings.editNote,
                icon: Icons.check,
                onPressed: cubit.editNote,
              ),

              SizedBox(
                height: MyResponsive.height(context, value: 32),
              ),

              // Add your form fields or other widgets here for editing the note
              AppTextField(
                  controller: cubit.titleController, hint: AppStrings.title),
              SizedBox(height: MyResponsive.height(context, value: 16)),
              AppTextField(
                controller: cubit.contentController,
                hint: AppStrings.content,
                maxLines: 5,
              ),
              SizedBox(height: MyResponsive.height(context, value: 32)),
              EditNoteColorList(),
            ],
          );
        }),
      ),
    );
  }
}

class EditNoteColorList extends StatelessWidget {
  const EditNoteColorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyResponsive.height(context, value: 70),
      child: ListView.builder(
        itemCount: AppColors.itemColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: MyResponsive.paddingSymmetric(context, horizontal: 4),
          child: BlocBuilder<EditNoteCubit, EditNoteState>(
              builder: (context, state) {
            EditNoteCubit editNoteCubit = EditNoteCubit.get(context);
            return GestureDetector(
              onTap: () => editNoteCubit.colorPicker(index),
              child: ColorItem(
                color: AppColors.itemColors[index],
                isSelected: editNoteCubit.currentIndex == index,
              ),
            );
          }),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/features/add&edit_note/data/repo/add_note_repo.dart';
import 'package:notes/features/home/data/model/note_model.dart';

import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  int currentIndex = 0;
  Color currentColor = AppColors.itemColors[0];

  AddNoteRepo addNoteRepo = AddNoteRepo();

  void onPressedAddTask() async {
    if (formKey.currentState!.validate()) {
      emit(AddNoteLoading());
      try {
        // Add note logic here
        var currentDate = DateTime.now();
        var formatedDate = DateFormat("MMM-dd, yyyy").format(currentDate);
        NoteModel note = NoteModel(
          title: titleController.text,
          subTitle: contentController.text,
          date: formatedDate.toString(),
          color: currentColor.value,
        );

        addNoteRepo.addNote(note);
        emit(AddNoteSuccess());
      } catch (e) {
        emit(AddNoteFailure(e.toString()));
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      return;
    }
  }

  editNote(NoteModel note) {
    titleController.text = note.title;
    contentController.text = note.subTitle;
  }

  colorPicker(int index) {
    currentIndex = index;
    currentColor = AppColors.itemColors[index];
    emit(AddNotePickedColor());
  }
}

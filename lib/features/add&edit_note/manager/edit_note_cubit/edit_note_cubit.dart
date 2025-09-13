import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';

import '../../../home/data/model/note_model.dart';
import 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  static EditNoteCubit get(context) => BlocProvider.of(context);

  NoteModel? noteModel;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  int currentIndex = 0;
  Color? currentColor;

  void loadNote(NoteModel note) {
    noteModel = note;
    titleController.text = note.title;
    contentController.text = note.subTitle;
    currentColor = Color(note.color!);
    currentIndex = AppColors.itemColors.indexOf(currentColor!);
    emit(EditNoteLoaded());
  }

  void editNote() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      return;
    }

    noteModel!.title = titleController.text;
    noteModel!.subTitle = contentController.text;
    noteModel!.color = currentColor!.value;
    await noteModel!.save();

    emit(EditNoteSuccess());
  }

  void colorPicker(int index) {
    currentIndex = index;
    currentColor = AppColors.itemColors[index];
    emit(EditNotePickedColor());
  }
}

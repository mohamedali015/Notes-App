import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/model/note_model.dart';
import 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  static EditNoteCubit get(context) => BlocProvider.of(context);

  NoteModel? noteModel;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void loadNote(NoteModel note) {
    noteModel = note;
    titleController.text = note.title;
    contentController.text = note.subTitle;
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
    await noteModel!.save();

    emit(EditNoteSuccess());
  }
}

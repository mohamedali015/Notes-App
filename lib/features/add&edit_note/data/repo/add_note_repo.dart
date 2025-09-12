import 'package:hive/hive.dart';
import 'package:notes/features/home/data/model/note_model.dart';

import '../../../../core/utils/app_constants.dart';

class AddNoteRepo {
  // singleton
  AddNoteRepo._();

  static final AddNoteRepo instance = AddNoteRepo._();

  factory AddNoteRepo() => instance;

  void addNote(NoteModel note) async {
    var notesBox = Hive.box<NoteModel>(AppConstants.kNotesBox);
    await notesBox.add(note);
  }
}

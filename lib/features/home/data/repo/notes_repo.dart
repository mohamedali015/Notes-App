import 'package:hive/hive.dart';
import 'package:notes/core/utils/app_constants.dart';
import 'package:notes/features/home/data/model/note_model.dart';

class NotesRepo {
  // singleton

  NotesRepo._();

  static final NotesRepo instance = NotesRepo._();

  factory NotesRepo() => instance;

  List<NoteModel> getNotes() {
    var notesBox = Hive.box<NoteModel>(AppConstants.kNotesBox);
    return notesBox.values.toList();
  }
}

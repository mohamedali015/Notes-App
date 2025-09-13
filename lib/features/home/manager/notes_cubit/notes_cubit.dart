import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/data/model/note_model.dart';
import 'package:notes/features/home/data/repo/notes_repo.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  List<NoteModel>? notes;

  NotesRepo notesRepo = NotesRepo();

  void getNotes() {
    notes = notesRepo.getNotes();
  }

  void deleteNote(NoteModel note) {
    notesRepo.deleteNote(note);
  }
}

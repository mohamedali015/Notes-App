import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/data/model/note_model.dart';

import '../manager/edit_note_cubit/edit_note_cubit.dart';
import 'widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit()..loadNote(note),
      child: Scaffold(
        body: EditNoteViewBody(noteModel: note),
      ),
    );
  }
}

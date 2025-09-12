import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';

import '../../add_note/view/add_note_bottom_sheet.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: AppColors.yellow,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';

import '../../add&edit_note/view/add_note_bottom_sheet.dart';
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
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

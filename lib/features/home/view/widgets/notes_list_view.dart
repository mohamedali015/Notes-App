import 'package:flutter/material.dart';

import '../../../../core/helper/my_responsive.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: MyResponsive.paddingSymmetric(context, vertical: 4),
          child: NoteItem(),
        );
      },
    );
  }
}

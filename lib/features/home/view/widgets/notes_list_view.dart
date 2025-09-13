import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/data/model/note_model.dart';

import '../../../../core/helper/my_responsive.dart';
import '../../../../core/utils/app_assets.dart';
import '../../manager/notes_cubit/notes_cubit.dart';
import '../../manager/notes_cubit/notes_state.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = NotesCubit.get(context).notes!;
        return notes.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "There are No Notes yet,\nPress the button\nTo add New Note",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: MyResponsive.height(context, value: 16),
                  ),
                  Image.asset(
                    AppAssets.emptyNotes,
                    width: double.infinity,
                  ),
                ],
              )
            : ListView.builder(
                itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: MyResponsive.paddingSymmetric(context, vertical: 4),
              child: NoteItem(
                note: notes[index],
              ),
            );
          },
        );
      },
    );
  }
}

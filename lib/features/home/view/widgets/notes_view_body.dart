import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/shared_widgets/custom_app_bar.dart';
import 'package:notes/features/home/manager/notes_cubit/notes_cubit.dart';
import 'package:notes/features/home/manager/notes_cubit/notes_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = NotesCubit.get(context);
    notesCubit.getNotes();
    return Padding(
      padding: MyResponsive.paddingSymmetric(context, horizontal: 24),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) => Column(
          children: [
            SizedBox(
              height: MyResponsive.height(context, value: 55),
            ),
            CustomAppBar(
              title: AppStrings.notes,
              icon: Icons.search,
            ),
            notesCubit.notes == null
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "There are no tasks yet,\nPress the button\nTo add New Task",
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
                    ),
                  )
                : Expanded(
                    child: NotesListView(),
                  ),
          ],
        ),
      ),
    );
  }
}

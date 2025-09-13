import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/shared_widgets/custom_app_bar.dart';
import 'package:notes/features/home/manager/notes_cubit/notes_cubit.dart';
import 'package:notes/features/home/manager/notes_cubit/notes_state.dart';
import '../../../../core/utils/app_strings.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
            Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    );
  }
}

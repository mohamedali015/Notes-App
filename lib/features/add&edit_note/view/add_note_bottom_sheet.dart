import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/helper/my_snackbar.dart';
import 'package:notes/features/add&edit_note/manager/add_note_cubit/add_note_cubit.dart';

import '../manager/add_note_cubit/add_note_state.dart';
import 'widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNoteCubit>(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            MySnackbar.success(context, "Note Added Successfully");
          }
          if (state is AddNoteFailure) {
            MySnackbar.error(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Padding(
                padding: MyResponsive.paddingOnly(
                  context,
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  useRawBottom: true,
                ),
                child: SingleChildScrollView(
                  child: const AddNoteForm(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
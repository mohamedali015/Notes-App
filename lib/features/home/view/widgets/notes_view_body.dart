import 'package:flutter/material.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/shared_widgets/custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyResponsive.paddingSymmetric(context, horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: MyResponsive.height(context, value: 55),
          ),
          CustomAppBar(),
          SizedBox(
            height: MyResponsive.height(context, value: 24),
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}

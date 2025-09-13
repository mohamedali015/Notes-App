import 'package:flutter/material.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/features/home/data/model/note_model.dart';

import '../../../add&edit_note/view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to edit note view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView();
            },
          ),
        );
      },
      child: Container(
        padding: MyResponsive.paddingSymmetric(context,
            horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Color(note.color!), borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                note.title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: MyResponsive.fontSize(context, value: 26),
                ),
              ),
              subtitle: Padding(
                padding: MyResponsive.paddingOnly(context, top: 8),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    color: AppColors.subBlack,
                    fontSize: MyResponsive.fontSize(context, value: 18),
                  ),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.black,
                    size: MyResponsive.width(context, value: 30),
                  )),
            ),
            SizedBox(
              height: MyResponsive.height(context, value: 8),
            ),
            Text(
              note.date,
              style: TextStyle(
                color: AppColors.subBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes/core/helper/my_responsive.dart';
import 'package:notes/core/utils/app_colors.dart';

import '../../../add&edit_note/view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

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
            color: AppColors.itemColor, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Flutter Tips",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: MyResponsive.fontSize(context, value: 26),
                ),
              ),
              subtitle: Padding(
                padding: MyResponsive.paddingOnly(context, top: 8),
                child: Text(
                  "Build your career with Flutter",
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
              "May 20, 2024",
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

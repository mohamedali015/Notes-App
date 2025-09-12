import 'package:flutter/material.dart';
import 'package:notes/features/home/view/notes_view.dart';

import 'core/utils/app_strings.dart';
import 'core/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.mainTheme,
      home: NotesView(),
    );
  }
}

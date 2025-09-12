import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/features/home/data/model/note_model.dart';
import 'package:notes/features/home/view/notes_view.dart';

import 'core/utils/app_constants.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/app_theme.dart';
import 'features/home/manager/bloc_observer/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/repos/notes_repo.dart';
import 'package:notes/core/utils/di.dart';
import 'core/blocs/notes_cubit.dart';
import 'core/theme/app_theme.dart';
import 'features/add_note/views/add_note_view.dart';
import 'features/home/views/notes_view.dart';
import 'features/show_note/views/show_note_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(getIt<NotesRepo>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        initialRoute: '/',
        routes: {
          '/': (context) => const NotesView(),
          '/add': (context) => const AddNoteView(),
          '/show': (context) => const ShowNoteView(),
        },
      ),
    );
  }
}

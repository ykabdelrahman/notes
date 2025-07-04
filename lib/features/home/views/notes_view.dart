import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/features/home/views/widgets/notes_list.dart';
import '../../../core/cubits/notes_cubit.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/custom_colors.dart';
import 'widgets/notes_appbar.dart';
import 'widgets/notes_list_empty.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const NotesAppBar(),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                if (state is GetNotesSuccess) {
                  return NotesList(
                    notes: state.notes.reversed.toList(),
                  );
                } else if (state is NotesEmpty) {
                  return const NotesListEmpty();
                }
                return const Column();
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        onPressed: () => context.push(Routes.addNote),
        backgroundColor: CustomColors.darkGrey,
        child: const Icon(
          Icons.add_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

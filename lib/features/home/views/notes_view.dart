import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/views/widgets/notes_list.dart';
import '../../../core/blocs/notes_cubit.dart';
import '../../../core/utils/constants.dart';
import 'widgets/notes_appbar.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const NotesAppBar(),
              BlocConsumer<NotesCubit, NotesState>(
                listener: (context, state) {
                  if (state is GetNotesFailure) {
                    log(state.error);
                  }
                },
                builder: (context, state) {
                  if (state is GetNotesSuccess) {
                    return NotesList(
                      notes: state.notes.reversed.toList(),
                    );
                  }
                  return const Column();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: CustomColors.trueBlack,
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
    );
  }
}

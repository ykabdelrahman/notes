import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/views/screens/notes_screen_empty.dart';
import 'package:notes/views/screens/notes_screen_with_content.dart';
import '../../blocs/notes_cubit.dart';
import '../../constants.dart';
import '../widgets/custom_icon_button.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotesCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: [
              const NotesAppBar(),
              StreamBuilder<NotesState>(
                initialData: cubit.state,
                stream: cubit.stream,
                builder: (context, snapshot) {
                  if (cubit.notes.isEmpty) {
                    return const NotesScreenEmpty();
                  } else {
                    return NotesScreenWithContent(
                      notes: cubit.notes.reversed.toList(),
                    );
                  }
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

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Notes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          CustomIconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

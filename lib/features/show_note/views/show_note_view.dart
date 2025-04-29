import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/blocs/notes_cubit.dart';
import 'package:notes/core/models/note_model.dart';
import 'package:notes/core/widgets/custom_text_field.dart';
import 'widgets/show_note_appbar.dart';

class ShowNoteView extends StatefulWidget {
  const ShowNoteView({super.key});

  @override
  State<ShowNoteView> createState() => _ShowNoteViewState();
}

class _ShowNoteViewState extends State<ShowNoteView> {
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void initState() {
    titleController = TextEditingController();
    bodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NoteModel note =
        (ModalRoute.of(context)?.settings.arguments as Map)['note'];
    titleController.text = note.title;
    bodyController.text = note.body;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              const ShowNoteAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hint: 'Title',
                        controller: titleController,
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        hint: 'Type something...',
                        controller: bodyController,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          note.title = titleController.text;
          note.body = bodyController.text;
          note.save();
          context.read<NotesCubit>().getNotes();
          Navigator.pop(context);
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/blocs/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_icon_button.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class ShowNoteScreen extends StatelessWidget {
  const ShowNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    var cubit = BlocProvider.of<NotesCubit>(context);

    NoteModel note =
        (ModalRoute.of(context)?.settings.arguments as Map)['note'];

    titleController.text = note.title;
    bodyController.text = note.body;

    return StreamBuilder<NotesState>(
        stream: cubit.stream,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
                cubit.getAllNotes();
                Navigator.pop(context);
              },
              label: const Text('Save'),
              icon: const Icon(Icons.save),
            ),
          );
        });
  }
}

class ShowNoteAppBar extends StatelessWidget {
  const ShowNoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomIconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 16),
          CustomIconButton(
            icon: const Icon(
              Icons.palette_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

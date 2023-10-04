import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_icon_button.dart';
import 'package:notes/views/widgets/custom_text_field.dart';
import '../../blocs/notes_cubit.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    var notesCubit = BlocProvider.of<NotesCubit>(context);

    return StreamBuilder<NotesState>(
        stream: notesCubit.stream,
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
                    const AddNoteAppBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hint: 'Title',
                              controller: titleController,
                              autoFocus: true,
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
                if (titleController.text.isNotEmpty &&
                    bodyController.text.isNotEmpty) {
                  var date = DateTime.now();
                  var formattedDate = DateFormat.yMd().format(date);
                  var notemodel = NoteModel(
                    title: titleController.text,
                    body: bodyController.text,
                    date: formattedDate,
                    color: Colors.lightBlueAccent.value,
                  );
                  notesCubit.addNote(notemodel);
                  Navigator.pop(context);
                }
              },
              label: const Text('Save'),
              icon: const Icon(Icons.save),
            ),
          );
        });
  }
}

class AddNoteAppBar extends StatelessWidget {
  const AddNoteAppBar({super.key});

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

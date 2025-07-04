import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:notes/core/models/note_model.dart';
import 'package:notes/core/widgets/custom_text_field.dart';
import '../../../core/cubits/notes_cubit.dart';
import '../../../core/theme/custom_colors.dart';
import 'widgets/add_note_appbar.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                        maxLines: 1,
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
                        isLastInput: true,
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
              color: Colors.lightBlueAccent.toARGB32(),
            );
            context.read<NotesCubit>().addNote(notemodel);
            context.pop();
          }
        },
        backgroundColor: CustomColors.darkGrey,
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

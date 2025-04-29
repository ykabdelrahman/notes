import 'package:flutter/material.dart';
import 'package:notes/core/utils/constants.dart';
import 'package:notes/core/models/note_model.dart';
import 'package:notes/features/home/views/widgets/notes_list_empty.dart';
import 'note_item.dart';
import 'show_delete_dialog.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.notes});

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? const NotesListEmpty()
        : Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Dismissible(
                    confirmDismiss: (DismissDirection direction) {
                      return showDeleteDialog(context, notes[index]);
                    },
                    direction: DismissDirection.horizontal,
                    background: Container(
                      color: CustomColors.deepRed,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.delete_rounded,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    key: UniqueKey(),
                    child: Material(
                      color: Color(notes[index].color),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        splashColor: Colors.purple,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/show',
                            arguments: {'note': notes[index]},
                          );
                        },
                        child: NoteItem(note: notes[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}

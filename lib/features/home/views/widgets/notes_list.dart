import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/theme/custom_colors.dart';
import 'package:notes/core/models/note_model.dart';
import '../../../../core/routes/routes.dart';
import 'note_item.dart';
import 'show_delete_dialog.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Dismissible(
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
          child: NoteItem(
              note: notes[index],
              onTap: () => context.push(Routes.showNote, extra: notes[index])),
        );
      },
    );
  }
}

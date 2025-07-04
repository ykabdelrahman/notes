import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/notes_cubit.dart';
import '../../../../core/models/note_model.dart';

Future<bool?> showDeleteDialog(BuildContext context, NoteModel note) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
          "Are you sure you want to delete this note?",
          style: TextStyle(fontSize: 19),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              context.read<NotesCubit>().deleteNote(note);
              Navigator.of(context).pop(true);
            },
            child: const Text(
              "DELETE",
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "CANCEL",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}

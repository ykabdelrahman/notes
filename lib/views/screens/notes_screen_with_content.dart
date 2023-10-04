import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

import '../../blocs/notes_cubit.dart';

class NotesScreenWithContent extends StatelessWidget {
  const NotesScreenWithContent({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotesCubit>(context);

    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: Dismissible(
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text(
                        "Are you sure you want to delete this note?",
                        style: TextStyle(fontSize: 19),
                      ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () => {
                            notes[index].delete(),
                            cubit.getAllNotes(),
                            Navigator.of(context).pop(true),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ListTile(
                          title: Text(
                            notes[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              notes[index].body,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black.withOpacity(.6),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: Text(
                            notes[index].date,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    getAllNotes();
  }

  List<NoteModel> notes = [];
  getAllNotes() {
    var noteBox = Hive.box<NoteModel>('notes');
    notes = noteBox.values.toList();
    emit(GetNotesSuccess());
  }

  addNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>('notes');
      await noteBox.add(note);
      getAllNotes();
      emit(AddNoteSuccess());
    } catch (e) {
      debugPrint('failed');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/models/note_model.dart';
import '../repos/notes_repo.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.notesRepo) : super(NotesInitial());
  final NotesRepo notesRepo;

  getNotes() {
    notesRepo.getNotes().fold(
      (error) => emit(GetNotesFailure(error)),
      (notes) {
        emit(GetNotesSuccess(notes));
      },
    );
  }

  addNote(NoteModel note) async {
    var result = await notesRepo.addNote(note);
    result.fold(
      (error) => emit(AddNoteFailure(error)),
      (success) {
        emit(AddNoteSuccess());
        getNotes();
      },
    );
  }

  deleteNote(NoteModel note) async {
    var result = await notesRepo.deleteNote(note);
    result.fold(
      (error) => emit(DeleteNoteFailure(error)),
      (success) {
        emit(DeleteNoteSuccess());
        getNotes();
      },
    );
  }
}

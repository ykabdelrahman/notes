import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/models/note_model.dart';
import 'notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  @override
  Either<String, List<NoteModel>> getNotes() {
    try {
      var noteBox = Hive.box<NoteModel>('notes');
      return Right(noteBox.values.toList());
    } catch (e) {
      log(e.toString());
      return const Left('Failed to get notes');
    }
  }

  @override
  Future<Either<String, void>> addNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>('notes');
      await noteBox.add(note);
      return const Right(null);
    } catch (e) {
      return const Left('Failed to add note');
    }
  }

  @override
  Future<Either<String, void>> deleteNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>('notes');
      await noteBox.delete(note.key);
      return const Right(null);
    } catch (e) {
      return const Left('Failed to delete note');
    }
  }
}

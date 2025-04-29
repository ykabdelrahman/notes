import 'package:dartz/dartz.dart';
import '../models/note_model.dart';

abstract class NotesRepo {
  Either<String, List<NoteModel>> getNotes();
  Future<Either<String, void>> addNote(NoteModel note);
  Future<Either<String, void>> deleteNote(NoteModel note);
}

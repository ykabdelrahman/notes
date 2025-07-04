part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class GetNotesSuccess extends NotesState {
  final List<NoteModel> notes;
  GetNotesSuccess(this.notes);
}

final class GetNotesFailure extends NotesState {
  final String error;
  GetNotesFailure(this.error);
}

final class NotesEmpty extends NotesState {}

final class AddNoteSuccess extends NotesState {}

final class AddNoteFailure extends NotesState {
  final String error;
  AddNoteFailure(this.error);
}

final class DeleteNoteSuccess extends NotesState {}

final class DeleteNoteFailure extends NotesState {
  final String error;
  DeleteNoteFailure(this.error);
}

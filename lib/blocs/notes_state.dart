part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class AddNoteSuccess extends NotesState {}

final class GetNotesSuccess extends NotesState {}

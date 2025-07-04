import 'package:go_router/go_router.dart';
import '../../features/add_note/views/add_note_view.dart';
import '../../features/home/views/notes_view.dart';
import '../../features/show_note/views/show_note_view.dart';
import '../models/note_model.dart';
import '../utils/transition_func.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const NotesView(),
        ),
      ),
      GoRoute(
        path: Routes.addNote,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const AddNoteView(),
        ),
      ),
      GoRoute(
        path: Routes.showNote,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: ShowNoteView(note: state.extra as NoteModel),
        ),
      ),
    ],
  );
}

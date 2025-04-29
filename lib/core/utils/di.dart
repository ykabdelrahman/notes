import 'package:get_it/get_it.dart';
import '../repos/notes_repo.dart';
import '../repos/notes_repo_impl.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<NotesRepo>(() => NotesRepoImpl());
}

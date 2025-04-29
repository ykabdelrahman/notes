import 'package:hive_flutter/hive_flutter.dart';
import '../models/note_model.dart';

class SetupHive {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
    await Hive.openBox<NoteModel>('notes');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/bloc_observer.dart';
import 'app.dart';
import 'core/utils/di.dart';
import 'core/utils/setup_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  setupGetIt();
  await SetupHive.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/bloc_observer.dart';
import 'app.dart';
import 'core/utils/di.dart';
import 'core/utils/setup_hive.dart';

void main() async {
  setupGetIt();
  await SetupHive.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

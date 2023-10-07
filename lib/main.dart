import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Wakelock.enable();
  runApp(
    const App(),
  );
}

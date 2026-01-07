import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // it can only show portait screen.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, // optional
  ]);

  runApp(ProviderScope(child: const MyApp()));
}
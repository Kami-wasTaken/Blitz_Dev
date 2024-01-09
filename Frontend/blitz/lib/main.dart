// ignore_for_file: prefer_const_constructors

import 'package:blitz/firebase_options.dart';
import 'package:blitz/pages/dashboard/barchart/progress_chart.dart';
import 'package:blitz/pages/dashboard/dashboard.dart';
import 'package:blitz/pages/login_reg/prompt_page.dart';
import 'package:blitz/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: Dashboard(),
    );
  }
}

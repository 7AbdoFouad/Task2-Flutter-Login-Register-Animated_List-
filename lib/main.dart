// ignore_for_file: unused_import

import 'AnimatedListPractice.dart';
import 'package:flutter/material.dart';
import 'AnimatedListTask.dart';
import 'RegisterScreenPractice.dart';
import 'LoginScreenTask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          accentColor: Colors.green.shade700,
          brightness: Brightness.light,
          errorColor: Colors.red,
          backgroundColor: Colors.blueGrey,
        ),
      ),
      home: const LoginScreenTask(),
    );
  }
}

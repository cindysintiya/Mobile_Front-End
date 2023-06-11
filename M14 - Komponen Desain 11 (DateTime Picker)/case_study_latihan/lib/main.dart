import 'package:flutter/material.dart';
import 'package:case_study_latihan/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211110347',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Pertemuan14Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
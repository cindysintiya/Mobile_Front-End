import 'package:flutter/material.dart';
import 'package:case_study/screens/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const Pertemuan10Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
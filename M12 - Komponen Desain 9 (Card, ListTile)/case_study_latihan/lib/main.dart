import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';
import 'package:case_study_latihan/screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan12Provider())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211110347 - Cindy Sintiya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan12Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';
import 'package:case_study_latihan/screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan15Provider())
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
      title: '211110347',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Pertemuan15Screen(),
      // home: const VideoPlayerApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
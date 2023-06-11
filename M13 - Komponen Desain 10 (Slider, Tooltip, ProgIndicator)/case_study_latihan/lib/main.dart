import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/providers/pertemuan13_provider.dart';
import 'package:case_study_latihan/screens/pertemuan13_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan13Provider())
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
      home: const Pertemuan13Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
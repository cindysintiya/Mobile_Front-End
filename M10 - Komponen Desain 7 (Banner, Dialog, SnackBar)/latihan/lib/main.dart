import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/provider.dart';
import 'package:latihan/screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> LatihanProvider())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LatihanScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
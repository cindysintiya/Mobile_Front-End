import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/provider.dart';
import 'package:latihan/screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LatihanProvider())
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
        primarySwatch: const MaterialColor(0xFFEBB5FF, {
          900: Color(0xFFEBB5FF),
          800: Color(0xFFEBB5FF),
          700: Color(0xFFEBB5FF),
          600: Color(0xFFEBB5FF),
          500: Color(0xFFEBB5FF),
          400: Color(0xFFEBB5FF),
          300: Color(0xFFEBB5FF),
          200: Color(0xFFEBB5FF),
          100: Color(0xFFEBB5FF),
          50: Color(0xFFEBB5FF),
        }),
      ),
      home: const LatihanScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
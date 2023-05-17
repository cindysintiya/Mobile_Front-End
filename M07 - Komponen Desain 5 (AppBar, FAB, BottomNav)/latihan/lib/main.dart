import 'package:flutter/material.dart';
import 'package:latihan/screens/hidup_dimana.dart';
import 'package:provider/provider.dart';
import 'package:latihan/providers/mygame_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyGameProvider())
      ],
      child: const MyApp()
      )
    );
}

MaterialColor myCustomColor({int red=255, int green=240, int blue=171}) {
  return MaterialColor(Color.fromRGBO(red, green, blue, 1).value, {
    50: Color.fromRGBO(red, green, blue, 0.1),
    100: Color.fromRGBO(red, green, blue, 0.2),
    200: Color.fromRGBO(red, green, blue, 0.3),
    300: Color.fromRGBO(red, green, blue, 0.4),
    400: Color.fromRGBO(red, green, blue, 0.5),
    500: Color.fromRGBO(red, green, blue, 1),  // floating action button, radio, checkbox
    600: Color.fromRGBO(red, green, blue, 0.7),
    700: Color.fromRGBO(red, green, blue, 0.8),
    800: Color.fromRGBO(red, green, blue, 0.9),
    900: Color.fromRGBO(red, green, blue, 1),
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211110347 - Cindy Sintiya',
      theme: ThemeData(
        // primarySwatch: Color.fromARGB(255, 255, 240, 171),
        primarySwatch: myCustomColor(),
      ),
      home: const HidupDimana(),
      debugShowCheckedModeBanner: false,
    );
  }
}
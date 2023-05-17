import 'package:flutter/material.dart';
import 'package:latihan/providers/kelas_provider.dart';
import 'package:latihan/providers/peminatan_provider.dart';
import 'package:latihan/providers/soal1_provider.dart';
import 'package:latihan/providers/soal2_provider.dart';
import 'package:provider/provider.dart';
import 'package:latihan/screens/quiz_screen.dart';
import 'package:latihan/providers/quiz_provider.dart';

// MaterialColor generateMaterialColor(Color color) {
//   return MaterialColor(color.value, const {
//     50: Color.fromRGBO(255, 102, 217, 1),
//     100: Color.fromRGBO(255, 102, 217, 0.9),
//     200: Color.fromRGBO(255, 102, 217, 0.8),
//     300: Color.fromRGBO(255, 102, 217, 0.7),
//     400: Color.fromRGBO(255, 102, 217, 0.6),
//     500: Color.fromRGBO(255, 102, 217, 0.5),
//     600: Color.fromRGBO(255, 102, 217, 0.4),
//     700: Color.fromRGBO(255, 102, 217, 0.3),
//     800: Color.fromRGBO(255, 102, 217, 0.2),
//     900: Color.fromRGBO(255, 102, 217, 0.1),
//   });
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // tambah provider(s) mu disini
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => PeminatanProvider()),
        ChangeNotifierProvider(create: (_) => KelasProvider()),
        ChangeNotifierProvider(create: (_) => Soal2Provider()),
        ChangeNotifierProvider(create: (_) => Soal1Provider()),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const QuizScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

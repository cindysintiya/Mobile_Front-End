import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/providers/switch_provider.dart';
import 'package:latihan/providers/dropdown_provider.dart';
import 'package:latihan/screens/cita_cita.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SwitchProvider()),
        ChangeNotifierProvider(create: (_) => DropDownProvider()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cita-Cita',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const CitaCitaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
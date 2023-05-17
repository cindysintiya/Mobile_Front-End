import 'package:case_study/screen/pertemuan6_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study/providers/pertemuan6_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pertemuan06Provider()),
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan06Provider>(context);
    return MaterialApp(
      title: '211110347 - Cindy Sintiya',
      theme: prov.enableDarkMode? prov.dark : prov.light,
      home: const Pertemuan06Screen(),
    );
  }
}
import 'package:flutter/material.dart';

class Pertemuan7Body extends StatelessWidget {
  final String title;
  const Pertemuan7Body({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Darat extends StatelessWidget {
  const Darat({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/darat.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
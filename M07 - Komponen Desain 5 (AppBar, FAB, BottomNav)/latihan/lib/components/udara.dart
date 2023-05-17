import 'package:flutter/material.dart';

class Udara extends StatelessWidget {
  const Udara({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/udara.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
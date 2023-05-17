import 'package:flutter/material.dart';

class Laut extends StatelessWidget {
  const Laut({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/laut.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
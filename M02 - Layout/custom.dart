import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(5));
  // Pastikan memiliki 5 gambar dengan penamaan pic0.jpg, pic1.jpg...pic4.jpg.
  // List.generate() adalah fungsi untuk membuat list
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(
    count, (i) => Container(child: Image.asset('assets/pic$i.jpg')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom GridView Builder (211110347 - Cindy Sintiya)'),
      ),
      body: _buildGrid(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/officialmenu_provider.dart';
import 'package:b_kreazi/components/menu_card.dart';

class AllMenu extends StatefulWidget {
  const AllMenu({super.key, required this.title});

  final String title;

  @override
  State<AllMenu> createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> {
  @override
  Widget build(BuildContext context) {
    final provMenu = Provider.of<OfficialMenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MenuCard(product: provMenu.allMenu),
      ),
    );
  }
}
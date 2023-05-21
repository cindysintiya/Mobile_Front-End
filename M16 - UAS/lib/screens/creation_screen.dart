import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/creation_provider.dart';
import 'package:b_kreazi/components/creation_card.dart';

class Creation extends StatefulWidget {
  const Creation({super.key, required this.title});

  final String title;

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {
  @override
  Widget build(BuildContext context) {
    final provCreation = Provider.of<CreationProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CreationCard(product: provCreation.allCreations, provider: provCreation),
    );
  }
}
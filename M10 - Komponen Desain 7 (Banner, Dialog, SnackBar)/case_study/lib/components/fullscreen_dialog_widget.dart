import 'package:flutter/material.dart';

class FullScreenDialog extends StatefulWidget {
  const FullScreenDialog({super.key});

  @override
  State<FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full-screen Dialog'),
      ),
      body: const Center(child: Text('Full-Screen Dialog'),),
    );
  }
}
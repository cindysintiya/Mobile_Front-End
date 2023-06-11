import 'package:flutter/material.dart';

class DurationAlert extends StatefulWidget {
  const DurationAlert({super.key});

  @override
  State<DurationAlert> createState() => _DurationAlertState();
}

class _DurationAlertState extends State<DurationAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Peringatan!'),
      content: const Text('Durasi memanggang tidak boleh 0'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text('OK')
        )
      ],
    );
  }
}
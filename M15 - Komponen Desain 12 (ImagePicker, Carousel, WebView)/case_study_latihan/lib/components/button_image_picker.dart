import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';

class ButtonImagePicker extends StatelessWidget {
  const ButtonImagePicker({super.key, required this.title, required this.isGallery});
  final String title;
  final bool isGallery;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan15Provider>(context);
    return ElevatedButton(
      onPressed: () async {
        await prov.pickedImage(isGallery);
      }, 
      child: Text(title)
    );
  }
}
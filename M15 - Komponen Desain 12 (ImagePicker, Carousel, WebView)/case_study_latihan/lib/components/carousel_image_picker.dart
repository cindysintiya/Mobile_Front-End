import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:case_study_latihan/components/webview_widget.dart';

class CarouselImagePicker extends StatefulWidget {
  const CarouselImagePicker({super.key, required this.listImg});
  final List<XFile>? listImg;

  @override
  State<CarouselImagePicker> createState() => _CarouselImagePickerState();
}

class _CarouselImagePickerState extends State<CarouselImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 300,
      child: CarouselSlider(
        options: CarouselOptions(height: 400),
        items: widget.listImg!.map((img) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewWidget(url: 'https://mikroskil.ac.id/pengumuman/3451')));
                },
                child: Image.file(File(img.path))
              );
            }
          );
        }).toList(), 
      ),
    );
  }
}
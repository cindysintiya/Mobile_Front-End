import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';
import 'package:case_study_latihan/components/button_image_picker.dart';
import 'package:case_study_latihan/components/carousel_slider.dart';
import 'package:case_study_latihan/components/carousel_image_picker.dart';

class Pertemuan15Screen extends StatefulWidget {
  const Pertemuan15Screen({super.key});

  @override
  State<Pertemuan15Screen> createState() => _Pertemuan15ScreenState();
}

class _Pertemuan15ScreenState extends State<Pertemuan15Screen> {
  List<XFile>? listImg;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan15Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
      ),
      body: ListView(
        children: [
          // Carousel
          const CarouselSliderWidget(),

          // Carousel from image picker
          if (listImg != null) CarouselImagePicker(listImg: listImg),

          // image picker ; menampilkan gambar terpilih jika ada
          prov.isImageLoaded? Image.file(File(prov.img!.path)) : Container(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonImagePicker(
                  title: 'Open Galery', 
                  isGallery: true
                ),
                TextButton(
                  onPressed: () async {
                    var pilihGbr = ImagePicker();
                    var hasil = await pilihGbr.pickMultiImage();
                    if (hasil == null) {
                      print('Tidak ada Foto');
                    }
                    else {
                      setState(() {
                        listImg = hasil;
                      });
                    }
                  }, 
                  child: const Text('Multi Image')
                ),
                const ButtonImagePicker(
                  title: 'Camera', 
                  isGallery: false
                ),
              ],
            ),
          ),

          // show multi image
          listImg != null?
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 4,
                  children: listImg!.map((img) => 
                    Image.file(File(img.path))
                  ).toList(),
                ),
              ),
            )
          : Container()
        ],
      ),
    );
  }
}
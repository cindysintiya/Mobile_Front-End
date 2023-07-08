import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';
import 'package:case_study_latihan/components/button_image_picker.dart';
import 'package:case_study_latihan/components/carousel_slider.dart';
import 'package:case_study_latihan/components/carousel_image_picker.dart';
import 'package:case_study_latihan/components/button_video_picker.dart';
import 'package:case_study_latihan/components/video_player_area.dart';

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
          const SizedBox(height: 20,),

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
                    // if (hasil.contains(null)) {
                    //   print('Tidak ada Foto');
                    // }
                    // else {
                    //   setState(() {
                    //     listImg = hasil;
                    //   });
                    // }
                    setState(() {
                      listImg = hasil;
                    });
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

          // Carousel from image picker
          if (listImg != null && listImg!.isNotEmpty) Column(
            children: [
              const Text('Carousel Image Picker'),
              CarouselImagePicker(listImg: listImg),
            ],
          ),
          const SizedBox(height: 20,),

          // image picker ; menampilkan gambar terpilih jika ada
          prov.isImageLoaded? Column(
            children: [
              const Text('Image Picker'),
              Image.file(File(prov.img!.path)),
            ],
          ) : Container(),
          const SizedBox(height: 20,),

          // show multi image
          listImg != null && listImg!.isNotEmpty?
            Column(
              children: [
                const Text('Multi Image Picker'),
                SizedBox(
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
              ],
            )
          : Container(),
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ButtonVideoPicker(
                  title: 'Open Galery', 
                  isGallery: true
                ),
                ButtonVideoPicker(
                  title: 'Camera', 
                  isGallery: false
                ),
              ],
            ),
          ),

          // show video
          prov.isVideoLoaded? Column(
            children: const [
              Text('Video Player'),
              VideoPlayerArea(),
            ],
          ) : Container(),
        ],
      ),
    );
  }
}
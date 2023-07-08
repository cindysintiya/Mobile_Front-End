import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:case_study_latihan/components/webview_widget.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 300,
      child: CarouselSlider(
        options: CarouselOptions(height: 400),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewWidget(url: 'https://mikroskil.ac.id/berita?page=$i')));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/$i'),
                      fit: BoxFit.cover,
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('Text $i', style: const TextStyle(fontSize: 16),),
                    ),
                  ),
                ),
              );
            }
          );
        }).toList(), 
      ),
    );
  }
}
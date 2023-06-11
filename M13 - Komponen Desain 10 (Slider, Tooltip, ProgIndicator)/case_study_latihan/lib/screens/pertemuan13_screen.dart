import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/providers/pertemuan13_provider.dart';
import 'package:case_study_latihan/components/slider_widget.dart';
import 'package:case_study_latihan/components/progress_indicator_widget.dart';
import 'package:case_study_latihan/components/content_widget.dart';

class Pertemuan13Screen extends StatefulWidget {
  const Pertemuan13Screen({super.key});

  @override
  State<Pertemuan13Screen> createState() => _Pertemuan13ScreenState();
}

class _Pertemuan13ScreenState extends State<Pertemuan13Screen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Durasi Memanggang : ${prov.sliderValue.round()}'),
            const SliderWidget(),
            const Align(
              alignment: Alignment.bottomRight,
              child: ProgressIndicatorWidget(),
            ),
            const ContentWidget()
          ],
        ),
      ),
    );
  }
}
import 'package:case_study_latihan/components/duration_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/providers/pertemuan13_provider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);

    return Tooltip(
      message: prov.sliderValue.round().toString(),
      child: Slider(
        value: prov.sliderValue, 
        min: 0,
        max: 10,
        label: prov.sliderValue.round().toString(),
        onChanged: (value) {
          prov.sliderValue = value;
        },
        onChangeEnd: (value) {
          if (value.round() == 0) {
            showDialog(
              context: context, 
              builder: (context) {
                return const DurationAlert();
              }
            );
          }
        },
      ),
    );
  }
}
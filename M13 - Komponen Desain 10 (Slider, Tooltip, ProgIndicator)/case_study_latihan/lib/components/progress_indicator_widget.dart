import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/providers/pertemuan13_provider.dart';
import 'package:case_study_latihan/components/duration_alert.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  State<ProgressIndicatorWidget> createState() => _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 90)
      ),
      onPressed: () {
        if (prov.sliderValue.round() == 0) {
          showDialog(
            context: context, 
            builder: (context) {
              return const DurationAlert();
            }
          );
        }
        else {
          prov.mulaiMemanggang(prov.sliderValue.round());
        }
      }, 
      child: prov.sedangMemanggang == true? 
        // const CircularProgressIndicator(color: Colors.white,)
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(seconds: prov.sliderValue.round()),
          builder: (context, double val, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                  value: val,
                ),
                Text((val*prov.sliderValue).round().toString(), style: const TextStyle(color: Colors.white),)
              ],
            );
          },
        )
        : 
        const Text('Panggang')
    );
  }
}
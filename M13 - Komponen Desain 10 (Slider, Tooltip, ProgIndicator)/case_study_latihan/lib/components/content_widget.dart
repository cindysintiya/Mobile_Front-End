import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/providers/pertemuan13_provider.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    
    return Center(
      child: prov.sedangMemanggang? 
        SizedBox(
          width: 100,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: prov.sliderValue.round()),
            builder: (context, double val, _) {
              return LinearProgressIndicator(value: val,);
            },
          ),
        ) : prov.selesaiMasak? 
          Tooltip(
            message: 'Ayam Panggang dah Siap',
            child: Image.network('https://bit.ly/ayampanggang22', width: 300,),
          )
          :
          Container()
    );
  }
}
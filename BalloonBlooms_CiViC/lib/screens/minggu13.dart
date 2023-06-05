import 'package:baloonblooms/components/custom_color.dart';
import 'package:flutter/material.dart';

class CustomProduct extends StatefulWidget {
  const CustomProduct({super.key, required this.reference});

  final Map reference;

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  Widget build(BuildContext context) {

    tag(String str) {
      return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 10, 8, 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: myCustomColor()[400],
        ),
        child: Text(str, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
      );
    }

    smallTag(String str) {
      return Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.fromLTRB(18, 8, 5, 5),
        child: Text(str, style: TextStyle(backgroundColor: myCustomColor()[100], fontSize: 17.5),),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom the way u like!'),
      ),
      body: ListView(
        children: [
          tag('REFERENCE'),
          Card(
            elevation: 8,
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                children: [
                  Image.asset('assets/${widget.reference['code']}.jpg', width: MediaQuery.of(context).size.width/3, height: MediaQuery.of(context).size.width/2.65, fit: BoxFit.cover,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.reference['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),),
                      const SizedBox(height: 2,),
                      Text('Rp. ${widget.reference['price']/1000}.000,-', style: const TextStyle(fontSize: 16),),
                      const SizedBox(height: 5,),
                      const Text('Include :'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.reference['include'].map<Widget>((include) {
                          return Container(
                            padding: const EdgeInsets.only(left: 12),
                            width: MediaQuery.of(context).size.width/2.25,
                            child: Text('- $include'),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          tag('CUSTOMIZATION'),
          smallTag('BALLOON'),
          smallTag('RIBBON'),
          smallTag('ACCESSORIES'),
          smallTag('CELLOPHANE'),
          smallTag('CARD'),
          smallTag('PORTRAIT ART'),
          tag('CONTACT INFORMATION'),
        ],
      ),
    );
  }
}
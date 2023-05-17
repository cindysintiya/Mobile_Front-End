import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study/providers/pertemuan6_provider.dart';

class Pertemuan06Screen extends StatefulWidget {
  const Pertemuan06Screen({super.key});

  @override
  State<Pertemuan06Screen> createState() => _Pertemuan06ScreenState();
}

class _Pertemuan06ScreenState extends State<Pertemuan06Screen> {
  List items = [
    'Pilih Pekerjaan',
    'Mahasiswa',
    'Dosen',
    'Programmer',
    'UI UX Desainer',
    'Konsultan IT',
    'Project Manager',
    'PNS',
    'Wiraswasta'
  ];
  String itemSelected = 'Pilih Pekerjaan';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan06Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switches | DropdownB.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark mode theme'),
                Switch(
                  value: prov.enableDarkMode, 
                  activeColor: Colors.purple,
                  onChanged: ((value) => prov.setBrightness = value)  // ubah status switch
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pekerjaan'),
                DropdownButton(
                  items: items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(), 
                  value: itemSelected,
                  onChanged: (val) {
                    setState(() {
                      itemSelected = val as String;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
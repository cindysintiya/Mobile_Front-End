import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/providers/switch_provider.dart';
import 'package:latihan/providers/dropdown_provider.dart';

class CitaCitaScreen extends StatefulWidget {
  const CitaCitaScreen({super.key});

  @override
  State<CitaCitaScreen> createState() => _CitaCitaScreenState();
}

class _CitaCitaScreenState extends State<CitaCitaScreen> {
  @override
  Widget build(BuildContext context) {
    final provSwitch = Provider.of<SwitchProvider>(context);
    final provDrop = Provider.of<DropDownProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tampilkan Cita-cita', style: TextStyle(fontSize: 17),),
                Switch(
                  value: provSwitch.showDrop, 
                  onChanged: ((val) => provSwitch.showDrop = val)  // ubah status switch
                )
              ],
            ),
            Visibility(
              visible: provSwitch.showDrop,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text('Cita-Cita', style: TextStyle(fontSize: 17),),
                  DropdownButton(
                    items: provDrop.items.map((item) {
                      return DropdownMenuItem(
                        value: item['citacita'],
                        child: Text(item['citacita']),
                      );
                    }).toList(), 
                    value: provDrop.itemSelected,
                    onChanged: (val) {
                      provDrop.changeDropVal = val;
                    },
                  )
                ],
              ),
            ),
            Visibility(
              visible: provSwitch.showDrop && provDrop.itemSelected!='Pilih Cita-Cita',
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset('assets/${provDrop.itemSelected}.jpg', width: 300,),
                    ),
                    const Text('Cita-Cita', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text(provDrop.itemSelected, style: const TextStyle(fontSize: 17),),
                    const SizedBox(height: 8,),
                    const Text('Kata mereka', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text(provDrop.selDetail('theysaid'), style: const TextStyle(fontSize: 17),),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: 
                  !provSwitch.showDrop? const Text('Aktifkan tombol Switch untuk memilih Cita-Cita') :
                  provSwitch.showDrop && provDrop.itemSelected == 'Pilih Cita-Cita'? const Text('Pilih salah satu Cita-Cita untuk melihat Detail') :
                  null
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DropDownProvider extends ChangeNotifier {
  final List items = [
    {'citacita': 'Pilih Cita-Cita', 'theysaid': 'Pilih dulu cita-citanya'},
    {'citacita': 'Dokter', 'theysaid': 'Hebat ya jadi dokter. Kalo sakit tinggal sembuhin sendiri.'},
    {'citacita': 'Graphic Designer', 'theysaid': 'Tolong buatin desain donk. Gratis ya, kan cuman gambar.'},
    {'citacita': 'Programmer', 'theysaid': 'Ngetik-ngetik doank mah gue juga bisa.'},
    {'citacita': 'Pelukis', 'theysaid': 'Lukisan gak akan bisa memberimu makan.'},
    {'citacita': 'Full-Stack Developer', 'theysaid': 'Kamu hacker? Bisa ngehack NASA gak?'}
  ];
  String itemSelected = 'Pilih Cita-Cita';

  set changeDropVal(val) {
    itemSelected = val;
    notifyListeners();
  }
  selDetail(val) {
    return items.firstWhere((item) => item['citacita']==itemSelected)[val];
  }
}
import 'package:flutter/material.dart';

class Soal2Provider extends ChangeNotifier {
  // inisialisasi nilai awal
  String _soal2 = 'answ';

  // return nilai dr sekolah, praktik, dst
  String get soal2 => _soal2;

  // perubahan state, memakai konsep listen
  set soal2(val) {
    _soal2 = val;
    notifyListeners();
  }
}
